cask "eudic" do
  version "26.8.3,1228"
  sha256 "b1ae348b7ba1845243395b07e91f95968c7dac1b55a3837c9b5ce2dfd3a39f24"

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
