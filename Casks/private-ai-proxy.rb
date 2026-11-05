cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.8.4"
  sha256 arm:   "e4da43a2dd697d189fc5ae3632fe87680568e4c40de410f8facec3e977663480",
         intel: "aa6458e3b825448e978ca0fd696cbe009c293ea09229d192482dcd127e574931"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
