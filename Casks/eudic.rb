cask "eudic" do
  version "25.12.0,1182"
  sha256 "612156bd967e743da21aa68fd674ba5898ef008b2411760119c0d68c7283e189"

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
