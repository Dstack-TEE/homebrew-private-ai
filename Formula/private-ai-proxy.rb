class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.4.0/private-ai-proxy-cli-0.4.0-macos-arm64.tar.gz"
      sha256 "d871fb3b798248640881ff323002615843e80537e3b458dfe1e7d43b94f128fb"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.4.0/private-ai-proxy-cli-0.4.0-macos-x64.tar.gz"
      sha256 "4d094d1780b17d58e8181e766dc217681c485bdaa6a05ceddb1c195ce4c24c22"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.4.0/private-ai-proxy-cli-0.4.0-linux-arm64.tar.gz"
      sha256 "faacfc643b42fe01cbed21b4deb1b2afb73b6fedaa0fa22799bdaa6851830af0"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.4.0/private-ai-proxy-cli-0.4.0-linux-x64.tar.gz"
      sha256 "e31f6a2c6e766c82fdc66f00f8b90cd8dbeddde671ba1650a4e2242d4663db56"
    end
  end

  def install
    libexec.install "private-ai-proxy", "private-ai-proxy-service", "private-ai-proxy-helper"
    bin.install_symlink libexec/"private-ai-proxy" => "pap"
    bin.install_symlink libexec/"private-ai-proxy" => "private-ai-proxy"
    bin.install_symlink libexec/"private-ai-proxy" => "aci"
  end

  test do
    assert_equal "private-ai-proxy #{version}", shell_output("#{bin}/pap --version").strip
    assert_predicate libexec/"private-ai-proxy-service", :executable?
    assert_predicate libexec/"private-ai-proxy-helper", :executable?
  end
end
