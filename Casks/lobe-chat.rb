cask "lobe-chat" do
  arch arm: "-arm64", intel: "-x64"

  version "1.111.11"
  sha256 arm:   "748a2a390b1515fe1a0c6851d1fc2cb77a32876047982d7d8ef145c6339a9d3d",
         intel: "16ad00ee53f01f60c64a283945732a44b4e1e8639ac0a70ea422caedbb05b0e9"

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
