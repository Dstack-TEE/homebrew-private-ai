cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.9.0"
  sha256 arm:   "ad0b5f5a94383b96731ebb56be97946ea24dd4f7951435e5b3693725b32546bc",
         intel: "3ab838e428e33a8018afc17946ba1b4f5948f34a5e2fdb358f23ea42bff38edb"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
