cask "eudic" do
  version "25.11.0,1180"
  sha256 "a65505c44cd32df8b9c4f7099d1de097e577a53e02974731867af9aff4f37e4f"

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
