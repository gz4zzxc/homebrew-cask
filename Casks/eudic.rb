cask "eudic" do
  version "25.9.0,1179"
  sha256 "348b0b65101a49096581e98d435356f9caa3a03f91443c43f863fc0148a08acc"

  url "https://static.eudic.net/pkg/eudicmac.dmg?v=#{version.csv.second}",
      verified: "static.eudic.net/"
  name "Eudic"
  name "欧路词典"
  desc "Dictionary and translation application"
  homepage "https://www.eudic.net/"

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
