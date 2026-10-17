class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.6.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.6.0/private-ai-proxy-cli-0.6.0-macos-arm64.tar.gz"
      sha256 "fc7b019b3952a7406673fbc6b51cff3691c423d59075eef882b981dd5f4e5574"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.6.0/private-ai-proxy-cli-0.6.0-macos-x64.tar.gz"
      sha256 "78dfff0fa541dc6331de644f3fa07626cecd77c012e45c8c841ef1310223af0e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.6.0/private-ai-proxy-cli-0.6.0-linux-arm64.tar.gz"
      sha256 "c1bca51bddae7235a7f863e34da00d50c32a776032b0047665861061c9568646"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.6.0/private-ai-proxy-cli-0.6.0-linux-x64.tar.gz"
      sha256 "a660c023c5074de8968483636e3f71d1fb738d6a9ae3c52d2a041a542010c02b"
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
