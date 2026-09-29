class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.3.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.3.0/private-ai-proxy-cli-0.3.0-macos-arm64.tar.gz"
      sha256 "72565d250936b2db8fb02bcd8f1c15738f6544e69b04d5786f1598b19fc62ece"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.3.0/private-ai-proxy-cli-0.3.0-macos-x64.tar.gz"
      sha256 "7ead3753a8b47ff8d3db6fbe9708a0d74c428bab4d75f75bd60c359f1d18f787"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.3.0/private-ai-proxy-cli-0.3.0-linux-arm64.tar.gz"
      sha256 "842470983abb7b0768ae21f5063e62b71bbc1c6dacf699514ccf12ad215772dc"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.3.0/private-ai-proxy-cli-0.3.0-linux-x64.tar.gz"
      sha256 "f4bf74ef4af8c75e8dae530459e96384baee52f2b9fa0fa898fe4b09da34257a"
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
