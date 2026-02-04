cask "eudic" do
  version "26.2.0,1202"
  sha256 "eff19b7a864dd1407ece31c302ef293d39803ca15b2eb2032f2ddd00228f06ca"

  url "https://static.eudic.net/pkg/eudicmac.dmg?v=#{version.csv.second}",
      verified: "static.eudic.net/"
  name "Eudic"
  name "欧路词典"
  desc "Dictionary and translation application"
  homepage "https://www.eudic.net/"
  auto_updates true

  # livecheck do
  #   url "https://static.eudic.net/pkg/eudic_mac.xml"
  #   strategy :sparkle, &:short_version
  # end

  depends_on macos: ">= :catalina"

  app "Eudic.app"

  zap trash: [
    "~/Library/Application Support/Eudic",
    "~/Library/Caches/com.eusoft.eudic",
    "~/Library/Preferences/com.eusoft.eudic.plist",
    "~/Library/Saved Application State/com.eusoft.eudic.savedState",
    "~/Library/WebKit/com.eusoft.eudic",
  ]
end
