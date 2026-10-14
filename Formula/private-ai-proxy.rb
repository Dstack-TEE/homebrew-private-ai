class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.5.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.5.1/private-ai-proxy-cli-0.5.1-macos-arm64.tar.gz"
      sha256 "94d83b28ee9e90040931dcf066dc3ed3f4d1940baa14cee512697bc776689724"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.5.1/private-ai-proxy-cli-0.5.1-macos-x64.tar.gz"
      sha256 "75ac794b58853f913ab99f942feacc91bb14643131023cba0cc661e1b987cb44"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.5.1/private-ai-proxy-cli-0.5.1-linux-arm64.tar.gz"
      sha256 "fc3aa73b5e9e5c728d4b34b8c9d20b7fb6e037307e2363987f0007629ae76515"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.5.1/private-ai-proxy-cli-0.5.1-linux-x64.tar.gz"
      sha256 "ac4d1749ebe7788a3dc1886e89e8b36db865840b87ddfd05da724af1fb7e3d4f"
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
