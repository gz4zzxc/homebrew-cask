cask "futu-niuniu" do
  version "16.37.27308"
  sha256 "a7fd1f5b8baa72af51454998fe205185f9289ff1f0d778cb6ee0725b44817fa8"

  url "https://softwaredownload.futunn.com/FTNN_desktop_#{version}_Website.dmg"
  name "Futu Niuniu"
  name "富途牛牛"
  desc "Securities trading platform for HK, US and A-shares"
  homepage "https://www.futunn.com/"

  livecheck do
    url "https://itunes.apple.com/lookup?id=6502630894&country=hk"
    strategy :json do |json|
      json["results"].first["version"]
    end
  end

  auto_updates true
  depends_on :macos

  app "富途牛牛.app"

  zap trash: [
    "~/Library/Application Support/Futu",
    "~/Library/Caches/com.futu.FutuNiuniu",
    "~/Library/Preferences/com.futu.FutuNiuniu.plist",
    "~/Library/Saved Application State/com.futu.FutuNiuniu.savedState",
  ]
end
