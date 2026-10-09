cask "futu-niuniu" do
  version "16.34.27008"
  sha256 "599adc21cb30c08d14341ef10a204c61a2be9c53db76a61fdf12873a21c44d96"

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
