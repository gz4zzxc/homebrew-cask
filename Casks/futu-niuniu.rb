cask "futu-niuniu" do
  version "16.27.17208"
  sha256 "f1ea368f802f4815c15b95eabb3468fccfbd45224a49a50beb06f3866a5e4439"

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
