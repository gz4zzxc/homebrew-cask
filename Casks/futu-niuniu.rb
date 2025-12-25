cask "futu-niuniu" do
  version "15.45.14408"
  sha256 "f53299a8c5be0b43d66132c901c423081c6cfec03df90acc017e11a7d5f94d18"

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
    "~/Library/Preferences/com.futu.FutuNiuniu.plist",
    "~/Library/Saved Application State/com.futu.FutuNiuniu.savedState",
  ]
end
