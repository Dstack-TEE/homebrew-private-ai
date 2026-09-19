#!/usr/bin/env python3
"""Update the Formula and Cask from the stable Private AI Proxy release."""

from __future__ import annotations

import argparse
import json
import re
import urllib.request
from pathlib import Path

REPOSITORY = "Dstack-TEE/private-ai-gateway"
FEED_URL = f"https://github.com/{REPOSITORY}/releases/download/desktop-updates-stable/latest.json"
VERSION_PATTERN = re.compile(r"^[0-9]+\.[0-9]+\.[0-9]+$")
CHECKSUM_PATTERN = re.compile(r"^([0-9a-f]{64})  ([^/]+)$")
ROOT = Path(__file__).resolve().parents[1]


def fetch(url: str) -> bytes:
    request = urllib.request.Request(url, headers={"User-Agent": "homebrew-private-ai-updater"})
    with urllib.request.urlopen(request, timeout=30) as response:
        return response.read()


def stable_version() -> str:
    try:
        feed = json.loads(fetch(FEED_URL))
    except (OSError, UnicodeError, json.JSONDecodeError) as error:
        raise SystemExit(f"cannot read stable release feed: {error}") from error

    version = feed.get("version")
    if not isinstance(version, str) or VERSION_PATTERN.fullmatch(version) is None:
        raise SystemExit("stable release feed contains an invalid version")
    if feed.get("channel") != "stable":
        raise SystemExit("release feed is not the stable channel")
    return version


def release_checksums(version: str) -> dict[str, str]:
    url = f"https://github.com/{REPOSITORY}/releases/download/desktop-v{version}/SHA256SUMS"
    try:
        content = fetch(url).decode("ascii")
    except (OSError, UnicodeError) as error:
        raise SystemExit(f"cannot read release checksums: {error}") from error

    checksums: dict[str, str] = {}
    for line in content.splitlines():
        match = CHECKSUM_PATTERN.fullmatch(line)
        if match is None:
            continue
        checksum, filename = match.groups()
        if filename in checksums:
            raise SystemExit(f"duplicate checksum entry: {filename}")
        checksums[filename] = checksum
    return checksums


def require(checksums: dict[str, str], filename: str) -> str:
    try:
        return checksums[filename]
    except KeyError as error:
        raise SystemExit(f"release checksums do not contain {filename}") from error


def formula(version: str, checksums: dict[str, str]) -> str:
    release_url = f"https://github.com/{REPOSITORY}/releases/download/desktop-v{version}"
    assets = {
        platform: f"private-ai-proxy-cli-{version}-{platform}.tar.gz"
        for platform in ("macos-arm64", "macos-x64", "linux-arm64", "linux-x64")
    }
    hashes = {platform: require(checksums, filename) for platform, filename in assets.items()}
    return f'''class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/{REPOSITORY}"
  version "{version}"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "{release_url}/{assets['macos-arm64']}"
      sha256 "{hashes['macos-arm64']}"
    else
      url "{release_url}/{assets['macos-x64']}"
      sha256 "{hashes['macos-x64']}"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "{release_url}/{assets['linux-arm64']}"
      sha256 "{hashes['linux-arm64']}"
    else
      url "{release_url}/{assets['linux-x64']}"
      sha256 "{hashes['linux-x64']}"
    end
  end

  def install
    libexec.install "private-ai-proxy", "private-ai-proxy-service", "private-ai-proxy-helper"
    bin.install_symlink libexec/"private-ai-proxy" => "pap"
    bin.install_symlink libexec/"private-ai-proxy" => "private-ai-proxy"
    bin.install_symlink libexec/"private-ai-proxy" => "aci"
  end

  test do
    assert_equal "private-ai-proxy #{{version}}", shell_output("#{{bin}}/pap --version").strip
    assert_predicate libexec/"private-ai-proxy-service", :executable?
    assert_predicate libexec/"private-ai-proxy-helper", :executable?
  end
end
'''


def cask(version: str, checksums: dict[str, str]) -> str:
    arm_asset = f"private-ai-proxy-{version}-macos-arm64.dmg"
    intel_asset = f"private-ai-proxy-{version}-macos-x64.dmg"
    return f'''cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "{version}"
  sha256 arm:   "{require(checksums, arm_asset)}",
         intel: "{require(checksums, intel_asset)}"

  url "https://github.com/{REPOSITORY}/releases/download/desktop-v#{{version}}/private-ai-proxy-#{{version}}-macos-#{{arch}}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
'''


def write(path: Path, content: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(content if content.endswith("\n") else f"{content}\n")


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--print-version", action="store_true")
    arguments = parser.parse_args()

    version = stable_version()
    if arguments.print_version:
        print(version)
        return

    checksums = release_checksums(version)
    write(ROOT / "Formula/private-ai-proxy.rb", formula(version, checksums))
    write(ROOT / "Casks/private-ai-proxy.rb", cask(version, checksums))
    print(f"Updated Homebrew definitions to {version}")


if __name__ == "__main__":
    main()
