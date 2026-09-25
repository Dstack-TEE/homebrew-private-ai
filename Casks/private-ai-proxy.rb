cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.1.6"
  sha256 arm:   "fc98b34032a48e2f7dd09cdaa209d7a9d6197416397399136db78a4d22d8bbd7",
         intel: "b996661685d47e0f50f111730510bd088e753f476c02ed27316f4ce5e45fecfb"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
