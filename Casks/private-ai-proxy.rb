cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.5.0"
  sha256 arm:   "443a6b7ac6dc479e29cd28e1108639e7aa62f260467fc7c7eb22006166bf0fc6",
         intel: "e0cb8fa8cdfc1efebeee324294c41a5cfa49a70544d46ab697add8857a0bba59"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
