cask "eudic" do
  version "25.7.1"
  sha256 "4f1453b9d54361ea8440feb61f3ad00c723652362e14248fc5dd6f00bab9afa2"

  url "https://static.frdic.com/pkg/eudicmac.dmg",
      verified: "static.frdic.com/"
  name "Eudic"
  name "欧路词典"
  desc "Dictionary and translation application"
  homepage "https://www.eudic.net/"

  livecheck do
    url "https://www.eudic.net/v4/en/app/download"
    regex(/eudicmac\.dmg\?v=(\d+(?:-\d+)+)/i)
  end

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
