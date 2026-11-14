cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.8.5"
  sha256 arm:   "ab6b5177d06f37f96cec0ff4ea0347e8ab2fcc03ee6c83f6bf583b97d0a95c80",
         intel: "3c351d2dee858cda7ace7248c196b5932482c7cacf21fc8d331a87e631b438eb"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
