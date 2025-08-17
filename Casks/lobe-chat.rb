cask "lobe-chat" do
  arch arm: "-arm64", intel: "-x64"

  version "1.113.1"
  sha256 arm:   "340d90428310954782b6ff8f403d5723c61752d5c63546b8699ae2c9c60727b9",
         intel: "5ccf4916ce77b1746ec0248fb6d22f7b6994f2038fc401a8e6d71f03b2a60099"

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
