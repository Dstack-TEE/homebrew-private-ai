class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.10.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.10.0/private-ai-proxy-cli-0.10.0-macos-arm64.tar.gz"
      sha256 "539be7497b3305b0f3a29206030d9bdb97cc7bad6cc28c5e06decbc6748e0f3b"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.10.0/private-ai-proxy-cli-0.10.0-macos-x64.tar.gz"
      sha256 "e78b14430b7c635e2f1c75e3492c83d0648ca45da03647d086a226faf7eda23a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.10.0/private-ai-proxy-cli-0.10.0-linux-arm64.tar.gz"
      sha256 "52127ac1aa68b7226671b5f41d0f10ce84e95a51960c8087133e97d57c512af6"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.10.0/private-ai-proxy-cli-0.10.0-linux-x64.tar.gz"
      sha256 "effd40a051ea55b1593043d0d0ab3182b8a2eb2bddc8682f9129de935d41a47e"
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
