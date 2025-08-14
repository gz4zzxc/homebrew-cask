cask "lobe-chat" do
  arch arm: "-arm64", intel: "-x64"

  version "1.111.12"
  sha256 arm:   "3efe67fff5f2ad05c46a91d8d7e38b05b344e347259236fcf56a7bde42fe34e8",
         intel: "d65ca3494675abe1dcf60d3d511dcd9072d02aed544ca6d6b37f851e3db5be64"

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
