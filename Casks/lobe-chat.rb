cask "lobe-chat" do
  arch arm: "-arm64", intel: "-x64"

  version "1.112.4"
  sha256 arm:   "304a2a963fb3d1c8fef308c64d261582682ca7f2ff208acdb1de78e4c664b03d",
         intel: "947f21e7664dfae95a053a01efe604c6a24b233c3e3e2d52c71c3826c4b0134d"

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
