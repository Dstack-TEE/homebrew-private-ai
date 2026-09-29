cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.3.0"
  sha256 arm:   "97df2524323d18fe31d59fdb16b4d79a819b23c757f3171cb9c9a4d9c33b68a7",
         intel: "957447bf4f77c2938564ec71a8524f15e13a18cd3500c6c4ca536b4b9bb01162"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
