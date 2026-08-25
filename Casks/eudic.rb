cask "eudic" do
  version "26.8.2,1227"
  sha256 "689e973dbc037cc916e62cea9391566aeabd3c77747ad06075bdc70329b1c254"

  url "https://static.eudic.net/pkg/eudicmac.dmg?v=#{version.csv.second}"
  name "Eudic"
  name "欧路词典"
  desc "Dictionary and translation application"
  homepage "https://www.eudic.net/"

  livecheck do
    url "https://static.eudic.net/pkg/eudic_mac.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :catalina

  app "Eudic.app"

  zap trash: [
    "~/Library/Application Support/Eudic",
    "~/Library/Caches/com.eusoft.eudic",
    "~/Library/Preferences/com.eusoft.eudic.plist",
    "~/Library/Saved Application State/com.eusoft.eudic.savedState",
    "~/Library/WebKit/com.eusoft.eudic",
  ]
end
