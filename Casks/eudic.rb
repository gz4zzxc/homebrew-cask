cask "eudic" do
  version "26.9.1,1231"
  sha256 "8f4621edb79f75e6d33904a1290392606bf4bebe936fa9b288fad41db4836f69"

  url "https://static.eudic.net/pkg/eudicmac.dmg?v=#{version.csv.second}"
  name "Eudic"
  name "欧路词典"
  desc "Dictionary and translation application"
  homepage "https://www.eudic.net/"

  livecheck do
    url "https://static.eudic.net/pkg/eudic_mac.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :ventura

  app "Eudic.app"

  zap trash: [
    "~/Library/Application Support/Eudic",
    "~/Library/Caches/com.eusoft.eudic",
    "~/Library/Preferences/com.eusoft.eudic.plist",
    "~/Library/Saved Application State/com.eusoft.eudic.savedState",
    "~/Library/WebKit/com.eusoft.eudic",
  ]
end
