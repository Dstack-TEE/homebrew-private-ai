cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.2.1"
  sha256 arm:   "af294f335ea4f5c7a12b7b93a684a94739fad26ee5867ce0b797b8a80e7228b1",
         intel: "e2ba30ccd72d98d17d74edc12d586985aee271f0b4ab853c085c952871134377"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
