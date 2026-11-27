class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.11.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.11.1/private-ai-proxy-cli-0.11.1-macos-arm64.tar.gz"
      sha256 "89e2e3b956dde7ca7c8b1fe3adaffc21c654ec90d2c6e00145ab7f605cbf3958"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.11.1/private-ai-proxy-cli-0.11.1-macos-x64.tar.gz"
      sha256 "a5d2eb743bfaecce2c8632549853c1bf37ac4b65496b5b7d5d0408ae3b318eb5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.11.1/private-ai-proxy-cli-0.11.1-linux-arm64.tar.gz"
      sha256 "bce5fbcbc16d0126a12f33ddd4915455c9dd0176df13f37cac459fd1fc65677c"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.11.1/private-ai-proxy-cli-0.11.1-linux-x64.tar.gz"
      sha256 "f0fcccf5d3c113760da2660f11dc7d738fd4eeb546e34a243a56f77230bc850a"
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
