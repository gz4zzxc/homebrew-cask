cask "futu-niuniu" do
  version "16.11.15618"
  sha256 "8a57655e3c3e30d69dc9bc4fe2a6cd74935298609a889a99d1fbaae4c258c350"

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
