class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.8.5"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.5/private-ai-proxy-cli-0.8.5-macos-arm64.tar.gz"
      sha256 "109da7fce84cd184dcdb29b2b91a62d048213d0213f2ddb445ab26fcb21c6a6e"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.5/private-ai-proxy-cli-0.8.5-macos-x64.tar.gz"
      sha256 "b4271055fa4f40b736ec79555da42dd0f0fe27c256280763d8550a449aeea1bf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.5/private-ai-proxy-cli-0.8.5-linux-arm64.tar.gz"
      sha256 "7c66b1f822fc9deefb6c59c7157085903a929291ed083e04780ffd4badba2456"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.5/private-ai-proxy-cli-0.8.5-linux-x64.tar.gz"
      sha256 "e44d07b583e0dfb509517ed03ea67b55a661fc3be7716be01bf046390d3d5b68"
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
