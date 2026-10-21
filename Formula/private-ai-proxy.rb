class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.6.2"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.6.2/private-ai-proxy-cli-0.6.2-macos-arm64.tar.gz"
      sha256 "a81e171ee911e93dacad1969089dcf5e3280eabcfa035b775b1c477509768438"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.6.2/private-ai-proxy-cli-0.6.2-macos-x64.tar.gz"
      sha256 "9980bba0b38ada550de76fb5e2baf5c947c7f7c40406f52d252dfdd435c48379"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.6.2/private-ai-proxy-cli-0.6.2-linux-arm64.tar.gz"
      sha256 "abdd0b6e2635d53c91bfb7fdf02cd85e44fb0aa9dc4c6aff84a33af547feed1d"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.6.2/private-ai-proxy-cli-0.6.2-linux-x64.tar.gz"
      sha256 "69f446e0883408eb0e981d57b42b143510de8989a689f5216eaf94bead39e3a1"
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
