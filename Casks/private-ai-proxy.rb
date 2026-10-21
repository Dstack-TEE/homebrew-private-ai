cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.6.2"
  sha256 arm:   "6af7cd1435e0791939bdeddd37d20c295e125c799b5a2c21fc54c14cbaf310e6",
         intel: "c7694ec852480adb236165dd92e478cf3443b49e1b2d82d9c057b2f3dad7b005"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
