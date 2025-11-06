cask "futu-niuniu" do
  version "15.38.13708"
  sha256 "2e92b17aaa6cecb8d968be92f305218aaaee570900ab2edda443308025a4e7df"

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
