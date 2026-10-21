cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.6.1"
  sha256 arm:   "9b7357c30900ea66ac5273aa7d44ab3c4678c2340b23f89600b45b3f117b156b",
         intel: "7bd766b65ef0e387a7263ed34c9e0f9a45410e7119c9430e51bc9ce7a1baefce"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
