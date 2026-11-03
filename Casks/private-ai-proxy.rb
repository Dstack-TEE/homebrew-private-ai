cask "private-ai-proxy" do
  arch arm: "arm64", intel: "x64"

  version "0.8.0"
  sha256 arm:   "f69dafbd007303557a23c310eea509acab422249f316ff7da8602a118058c332",
         intel: "150bc1a39b588c6bcb7f55da460e59272015f54387ea39bcb9035f9646000b67"

  url "https://github.com/Dstack-TEE/private-ai-gateway/releases/download/desktop-v#{version}/private-ai-proxy-#{version}-macos-#{arch}.dmg"
  name "Private AI Proxy"
  desc "Local verified proxy for private AI applications"
  homepage "https://redpill.ai/private-ai-gateway"

  auto_updates true
  depends_on :macos

  app "Private AI Proxy.app"
end
