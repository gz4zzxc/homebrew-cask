cask "lobe-chat" do
  arch arm: "-arm64", intel: "-x64"

  version "1.111.10"
  sha256 arm:   "42a1b36824c81dcc4cb3ec48695a9f8a3c45c4b5ad595ff518cc73a9c128a868",
         intel: "982d3481c4642ac37ab8e29e7f3479a2011f5ad757495f1c1256cd93240c860f"

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
