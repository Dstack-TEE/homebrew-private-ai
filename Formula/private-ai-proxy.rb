class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.1.3"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.1.3/private-ai-proxy-cli-0.1.3-macos-arm64.tar.gz"
      sha256 "35c02fa914f4313da93f70c4560a5b0d43f8944d08021bd5ecf0db8ae20e91ea"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.1.3/private-ai-proxy-cli-0.1.3-macos-x64.tar.gz"
      sha256 "bb7fbd9ab59287e8459d4ea5d00f473eab793baab4c7554d7582d60ed6a8ac95"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.1.3/private-ai-proxy-cli-0.1.3-linux-arm64.tar.gz"
      sha256 "0cafba40ac0775283e0c1c70447a63667c52bf0a437c85f98e1a6d366f2e1ff1"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.1.3/private-ai-proxy-cli-0.1.3-linux-x64.tar.gz"
      sha256 "c84e41ee43e3b1a0a5f6fef4131fbd4cf5f0f515a18812dbed7f8a2057d70903"
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
