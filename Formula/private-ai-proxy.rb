class PrivateAiProxy < Formula
  desc "Local proxy and CLI for Attested Confidential Inference"
  homepage "https://github.com/Dstack-TEE/private-ai-gateway"
  version "0.1.4"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.1.4/private-ai-proxy-cli-0.1.4-macos-arm64.tar.gz"
      sha256 "13422af40503542e0f955412b7c146ae6a2a1785f49d825b98f69c8c977de6fd"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.1.4/private-ai-proxy-cli-0.1.4-macos-x64.tar.gz"
      sha256 "0950fbea5cd117a88253427df489d31cdf40bc5adba6936d76781fcbc81bfc74"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.1.4/private-ai-proxy-cli-0.1.4-linux-arm64.tar.gz"
      sha256 "9d1b41c09d00808efa8d00d08ecb10fd06afb326eece8c9fd79861e6e0c95821"
    else
      url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v0.1.4/private-ai-proxy-cli-0.1.4-linux-x64.tar.gz"
      sha256 "463e6813e5a96ee5fae334c4661c83067b0b86afd3d83de15e6900572fd7ca58"
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
