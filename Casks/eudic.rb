cask "eudic" do
  version "26.9.0,1229"
  sha256 "a63d5e3420c1b1339a6d98ef97298bcf3044f52f1efb812efcf27bc171406b11"

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
