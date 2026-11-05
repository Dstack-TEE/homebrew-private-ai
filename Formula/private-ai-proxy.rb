class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.8.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.4/private-ai-proxy-cli-0.8.4-macos-arm64.tar.gz"
      sha256 "f113321d45688761e9c91a3d31bc7626e8c22f06ce73b38e0374ee30c19e3577"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.4/private-ai-proxy-cli-0.8.4-macos-x64.tar.gz"
      sha256 "40eac9611177ab2b47a291eb080d4716091986b26676025210d9f3bf95d4ef30"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.4/private-ai-proxy-cli-0.8.4-linux-arm64.tar.gz"
      sha256 "03b99d9b9ec5e476aac67149b058292c41f87c85068177f6c93938d52ea71422"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.4/private-ai-proxy-cli-0.8.4-linux-x64.tar.gz"
      sha256 "e4ad3ac72449dcde29646abc5698a119d08333f2e87f37f78183a98f46ea0942"
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
