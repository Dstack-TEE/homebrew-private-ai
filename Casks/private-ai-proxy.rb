cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.6.0"
  sha256 arm:   "f423eeeb40661bd277bbe5366f9af6837725f91236ae5bad4ef874b3b793ca46",
         intel: "c6e061de83b3463cb538911fa4817756d43daa859379d6ea044094fd71d8a6ac"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
