class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.2.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.2.0/private-ai-proxy-cli-0.2.0-macos-arm64.tar.gz"
      sha256 "7125a2759c1312b4ceec68eead0b8a5f98bc5768bca298c9d4c7b799d80feabf"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.2.0/private-ai-proxy-cli-0.2.0-macos-x64.tar.gz"
      sha256 "925890acab71ae43830cf294fc55c26ca7c8fa3ba2480e8bd8b11a0a8a694806"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.2.0/private-ai-proxy-cli-0.2.0-linux-arm64.tar.gz"
      sha256 "7fdc803128ee3036a8ea746fe7c135a945472090f3e96ec016a64b76c7e47a9f"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.2.0/private-ai-proxy-cli-0.2.0-linux-x64.tar.gz"
      sha256 "a51acf43e725d5b256c37c59004ee6d23682b78d55e499bb50433465e92bfcfe"
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
