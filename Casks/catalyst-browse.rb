cask "catalyst-browse" do
  version "2025.2"
  sha256 "24bf06358ea7b9c359b934599786a5f9b97e970b7ebbcc3685d019c2c2bbadf1"

  url "https://di.update.sony.net/NEX/b579a2667c/Catalyst_Browse.dmg",
      verified: "di.update.sony.net/"
  name "Sony Catalyst Browse"
  name "Catalyst Browse"
  desc "Professional media browser and metadata viewer for video production workflows"
  homepage "https://www.sony.com/electronics/support/articles/CCCT03000"

  livecheck do
    url "https://www.sony.com/electronics/support/articles/CCCT03000"
    regex(/Catalyst\s+Browse\s+(\d+(?:\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  app "Catalyst Browse.app"

  zap trash: [
    "~/Library/Application Support/Catalyst Browse",
    "~/Library/Caches/com.sony.CatalystBrowse",
    "~/Library/Logs/Catalyst Browse",
    "~/Library/Preferences/com.sony.CatalystBrowse.plist",
    "~/Library/Saved Application State/com.sony.CatalystBrowse.savedState",
  ]
end
