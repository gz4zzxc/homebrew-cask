cask "futu-niuniu" do
  version "16.10.15508"
  sha256 "3d0c218a770031ef50270da3ae1b0298e38ffeb0092da3db2957acbde6698ef5"

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
