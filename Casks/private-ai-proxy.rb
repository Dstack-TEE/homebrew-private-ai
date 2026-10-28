cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.7.0"
  sha256 arm:   "851934d21357da4fcd3f7d2638216d13eb1a7bd2bc7889d3b72979fc024c3fa8",
         intel: "87f2d0e77c6e7912e421dd7d8834fff0fbdbe1da5a56cf61ada51417447b7d8a"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
