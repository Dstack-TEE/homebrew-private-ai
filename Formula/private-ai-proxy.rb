class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.5.0/private-ai-proxy-cli-0.5.0-macos-arm64.tar.gz"
      sha256 "b07691ef9b6124b27e2ac3f0079259b35bcfc11961e4f13e85e046818cf915c9"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.5.0/private-ai-proxy-cli-0.5.0-macos-x64.tar.gz"
      sha256 "e4bdd58666ff2a81d7359555dd8aa81ba032c2b2dc94fe958142e2f621e3bc66"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.5.0/private-ai-proxy-cli-0.5.0-linux-arm64.tar.gz"
      sha256 "53e0b42cb22eb538a61b6521dbdbb78916cf224f6f0b5fb4e61888e95d66da42"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.5.0/private-ai-proxy-cli-0.5.0-linux-x64.tar.gz"
      sha256 "e44a7722306c9d0024683d459a64f2174292f3b8c45f16f99484fb7e0105d7b5"
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
