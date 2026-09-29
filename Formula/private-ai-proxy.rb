class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.2.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.2.1/private-ai-proxy-cli-0.2.1-macos-arm64.tar.gz"
      sha256 "c4c928d0583311ac61e0fee8963a0b4643dc395ec229020646889ed5182cf9ba"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.2.1/private-ai-proxy-cli-0.2.1-macos-x64.tar.gz"
      sha256 "5252f90addf1550af198b711db1a1b34771d63bc5e1f3dbc8a69b3ec5f9f7ba7"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.2.1/private-ai-proxy-cli-0.2.1-linux-arm64.tar.gz"
      sha256 "d903866cfa2f27346139995d83aeaf53b75c06978eb096af14b322284be6b84a"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.2.1/private-ai-proxy-cli-0.2.1-linux-x64.tar.gz"
      sha256 "95698dfb9925e50fdd41da6f6dac3553a657f8218f9755e3ac4c1e50f83c6034"
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
