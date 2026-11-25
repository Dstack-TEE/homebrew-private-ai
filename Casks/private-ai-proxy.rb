cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.10.0"
  sha256 arm:   "46cd2f1965b8e723870fd8cab01cd730c192523dc3513969cb5f2ec164f75fa2",
         intel: "6ce5a89cf6c2247e2a08849f5a73112b0601dc2df100b7ff76135e4201c26ead"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
