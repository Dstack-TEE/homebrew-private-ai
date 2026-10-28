class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.7.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.7.0/private-ai-proxy-cli-0.7.0-macos-arm64.tar.gz"
      sha256 "a540fa699810c73d9520ca1b143561479b7f431b15a6d512d67e5357cc303b6d"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.7.0/private-ai-proxy-cli-0.7.0-macos-x64.tar.gz"
      sha256 "54d1324b8db11083e120205d399ce524796c59028e8432703ca05dd162df4764"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.7.0/private-ai-proxy-cli-0.7.0-linux-arm64.tar.gz"
      sha256 "cb49eed99377193c924aa9d919672d137a5c4fb77b255a9f9aa5cc8955113ca3"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.7.0/private-ai-proxy-cli-0.7.0-linux-x64.tar.gz"
      sha256 "cbd03964cfb1ea3de46eef857834e7eeb615b1494d30c64124ee0206b122fd3d"
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
