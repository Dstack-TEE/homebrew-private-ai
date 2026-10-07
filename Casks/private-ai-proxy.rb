cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.4.0"
  sha256 arm:   "1775e9853ee6121ebdd61433f197aa4b517082bba509e2b3ec54ea708007ca88",
         intel: "e0eeffbf571918838b6dcec779a1aa27661d66142d74541813bb2226cf188d63"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
