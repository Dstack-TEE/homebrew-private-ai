class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.8.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.0/private-ai-proxy-cli-0.8.0-macos-arm64.tar.gz"
      sha256 "87b63503ae6891c8fe012b955d38da27c24811699ae0fdf4c50f2274eb72a8f3"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.0/private-ai-proxy-cli-0.8.0-macos-x64.tar.gz"
      sha256 "c2bafdc51ff7c3ad7de156faee7cfb7f25a7513f1c3be5d901056026da339991"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.0/private-ai-proxy-cli-0.8.0-linux-arm64.tar.gz"
      sha256 "f393632219f49c04efe85e11397f50f02c1f8cf7aa8c313b7cf371327147af93"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.8.0/private-ai-proxy-cli-0.8.0-linux-x64.tar.gz"
      sha256 "368660964ea7657169fa4cca0ca3ef71ee734807829bdf6be756a620599ce5d8"
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
