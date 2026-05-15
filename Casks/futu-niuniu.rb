cask "futu-niuniu" do
  version "16.15.16008"
  sha256 "9a4252390fc9c6b861f3d50e2eb93a7891cbbe5a8b642b048f106b69fff44bf8"

  url "https://softwaredownload.futunn.com/FTNN_desktop_#{version}_Website.dmg"
  name "Futu Niuniu"
  name "富途牛牛"
  desc "富途证券官方交易软件，支持港股、美股、A股交易"
  homepage "https://www.futunn.com/"

  auto_updates true
  depends_on macos: :catalina

  app "富途牛牛.app"

  zap trash: [
    "~/Library/Application Support/Futu",
    "~/Library/Caches/com.futu.FutuNiuniu",
    "~/Library/Preferences/com.futu.FutuNiuniu.plist",
    "~/Library/Saved Application State/com.futu.FutuNiuniu.savedState",
  ]
end
