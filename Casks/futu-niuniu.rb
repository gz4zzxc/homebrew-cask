cask "futu-niuniu" do
  version "16.29.17418"
  sha256 "8938ab431eb28168b67203b8b9126b990893b8e62c20f0b54d6e217cc4b6e911"

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
  depends_on macos: :catalina

  app "富途牛牛.app"

  zap trash: [
    "~/Library/Application Support/Futu",
    "~/Library/Caches/com.futu.FutuNiuniu",
    "~/Library/Preferences/com.futu.FutuNiuniu.plist",
    "~/Library/Saved Application State/com.futu.FutuNiuniu.savedState",
  ]
end
