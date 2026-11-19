class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.9.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.9.0/private-ai-proxy-cli-0.9.0-macos-arm64.tar.gz"
      sha256 "3368a41701dcdb7f878065e45a0b19d0e4112c1c876bac010165c2d8aae5d554"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.9.0/private-ai-proxy-cli-0.9.0-macos-x64.tar.gz"
      sha256 "6ca62b76b61683b4148bddcd5109c07659f6460da38c0d06ccfc963d5ad43982"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.9.0/private-ai-proxy-cli-0.9.0-linux-arm64.tar.gz"
      sha256 "94358f1b87473aaa0e4b60c7e7e5d97c1dcfa935acddb8ad013b67ab294f6e6f"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.9.0/private-ai-proxy-cli-0.9.0-linux-x64.tar.gz"
      sha256 "60803c3e9d7da597dd98146734dddc177775f0392dd39747729b9654e372cda5"
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
