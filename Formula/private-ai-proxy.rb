class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.1.6"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.1.6/private-ai-proxy-cli-0.1.6-macos-arm64.tar.gz"
      sha256 "4ac5f0747d8775711f0a83ae0aca0e014b8fd64f20d50140cd515c163a80c06c"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.1.6/private-ai-proxy-cli-0.1.6-macos-x64.tar.gz"
      sha256 "371a58f76d60f51337acdc073c3bd749c29d5ab1565432d44eaa902d061e2564"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.1.6/private-ai-proxy-cli-0.1.6-linux-arm64.tar.gz"
      sha256 "fef8367a7c36f060933951c0e0ba1fb1800be28f1e18bc148f1e0b9e597bcb02"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.1.6/private-ai-proxy-cli-0.1.6-linux-x64.tar.gz"
      sha256 "52da23a7a996a77f2954658c995d2d888806ba69c3c538bc24589bf5ad867fc1"
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
