cask "futu-niuniu" do
  version "15.24.12308"
  sha256 "282d4d75e9247b2428ba148156558bbb5b3f9fce54f5ee08393000c56d20abe7"

  url "https://softwaredownload.futunn.com/FTNN_desktop_#{version}_Website.dmg"
  name "Futu Niuniu"
  name "富途牛牛"
  desc "富途证券官方交易软件，支持港股、美股、A股交易"
  homepage "https://www.futunn.com/"

  app "FutuNiuniu.app", target: "富途牛牛.app"

  zap trash: [
    "~/Library/Application Support/Futu",
    "~/Library/Preferences/com.futu.FutuNiuniu.plist",
    "~/Library/Saved Application State/com.futu.FutuNiuniu.savedState",
  ]
end
