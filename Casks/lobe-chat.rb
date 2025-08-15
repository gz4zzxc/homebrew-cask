cask "lobe-chat" do
  arch arm: "-arm64", intel: "-x64"

  version "1.112.0"
  sha256 arm:   "cbfc7caeabf1d3d03340877c84bb3138a7dff53e21c8c70ab847954043949b06",
         intel: "21f9cd4c037614cf9209ee858594240e4668cd8f2f1bf57676df13732d305848"

  url "https://github.com/lobehub/lobe-chat/releases/download/v#{version}/LobeHub-Beta-#{version}#{arch}.dmg",
      verified: "github.com/lobehub/"
  name "Lobe Chat"
  desc "Open-source AI chat app"
  homepage "https://github.com/lobehub/lobe-chat"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "LobeHub-Beta.app"
end
