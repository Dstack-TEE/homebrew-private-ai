cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.8.3"
  sha256 arm:   "66ca67d97fb27d83b15e77b555d40f928902568fb390457daad00e98a9bc646b",
         intel: "455e67e940bcbaf686a05289dc2eb74fbc89a8df8214ad8d179a59b708636bf3"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
