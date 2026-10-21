class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.6.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.6.1/private-ai-proxy-cli-0.6.1-macos-arm64.tar.gz"
      sha256 "7a9ecf889d69d43ea0b64fbd1588d88c6bc34c13b256baf5b3c86b207713d36e"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.6.1/private-ai-proxy-cli-0.6.1-macos-x64.tar.gz"
      sha256 "8fdab8208b422adc94e7e168eb3dcb3c29fe147d20dda1b45651e221dc946d11"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.6.1/private-ai-proxy-cli-0.6.1-linux-arm64.tar.gz"
      sha256 "aefa70cf7df34f3a8249d75b1b99e2ad088249998b2c6ac9777a39a215020c92"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.6.1/private-ai-proxy-cli-0.6.1-linux-x64.tar.gz"
      sha256 "89c3002bd13ffa927a644bd57fdc02491f7436be1cc9e476fa7967cff1ba7d17"
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
