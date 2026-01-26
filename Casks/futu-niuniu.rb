cask "futu-niuniu" do
  version "16.2.14708"
  sha256 "6e674114e7453d3887241883e522627539f0df03c1fa49a35cbced34cb149d51"

  url "https://softwaredownload.futunn.com/FTNN_desktop_#{version}_Website.dmg",
      verified: "softwaredownload.futunn.com/"
  name "Futu Niuniu"
  name "富途牛牛"
  desc "富途证券官方交易软件，支持港股、美股、A股交易"
  homepage "https://www.futunn.com/"
  auto_updates true

  app "富途牛牛.app"

  zap trash: [
    "~/Library/Application Support/Futu",
    "~/Library/Caches/com.futu.FutuNiuniu",
    "~/Library/Preferences/com.futu.FutuNiuniu.plist",
    "~/Library/Saved Application State/com.futu.FutuNiuniu.savedState",
  ]
end
