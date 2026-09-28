cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.2.0"
  sha256 arm:   "58cb74068bccd84ca2c363046b6e64a98389ab5bd02bbacb0eb377631a6d09ca",
         intel: "4007bbcaac92ace30448d96cc5b5251a07e2f4d8713f322ae970576b73f64c82"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
