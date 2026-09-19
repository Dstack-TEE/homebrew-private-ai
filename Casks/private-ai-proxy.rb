cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.1.3"
  sha256 arm:   "844289a1575e7c27143a0c760d2a2010c704511f31dda4459478a4d173d27f9a",
         intel: "4ba3da852b1cf3b06892930937f581413de950a74fce33c99d9939ecd86cd990"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true

  depends_on :macos

  app "Private AI Proxy.app"
end
