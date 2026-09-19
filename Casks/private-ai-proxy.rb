cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.1.4"
  sha256 arm:   "051c08106f23c773892d59af264c5316ebefcc6ef7f502289f8aae17fae42886",
         intel: "75cfa20aca6f13f33840dcdb7db8c3da138e469d3fef2cb9ce078eccb0ee4072"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
