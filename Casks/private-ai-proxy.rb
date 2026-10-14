cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.5.1"
  sha256 arm:   "442e82ffe2deb924f05c4f56ff99937faf5feb095474b2479810296b1d9896d7",
         intel: "b4cda391eeb14d205b66ec177ed64b89589b224c5ae7b6d426770a83b5b77ef1"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
