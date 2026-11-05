class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.8.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.3/private-ai-proxy-cli-0.8.3-macos-arm64.tar.gz"
      sha256 "726797bffcfd80bf45740d30da39172abb7de0c8769dada82e45855bd1352f4f"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.3/private-ai-proxy-cli-0.8.3-macos-x64.tar.gz"
      sha256 "945f2e7a681b9b31358938063eadde35b2180c793a2e0d10d0beaa525e305652"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.3/private-ai-proxy-cli-0.8.3-linux-arm64.tar.gz"
      sha256 "addbd324cef5d3c94621cb0f1ca494c475192d93baaed971648b90584b558ff2"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.3/private-ai-proxy-cli-0.8.3-linux-x64.tar.gz"
      sha256 "0da06e6e492a04d3f91551d3f485e3706fefb51a71d90c84bd3727ec98aea691"
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
