cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.11.1"
  sha256 arm:   "84abcbb911ae600f4d22bf5da76627f51607693639821dc34ef6fcda73c6baad",
         intel: "fe976353c50c8c8b9f1b6c295f4ca7695bfeecc2fd62d5657b8946306faf19d0"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
