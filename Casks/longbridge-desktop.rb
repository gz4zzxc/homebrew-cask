cask "longbridge-desktop" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.2.0,g7595e75"
  sha256 arm:   "0b389c7249467c2db06844b124d51b187cc26aeb65edce3612953e0ef55f5a9a",
         intel: "a88e2275a374eeb518064ec2cb96bdb30515a65c74e7fd578fe85de8b4caaf07"

  url "https://assets.lbkrs.com/github/release/longbridge-desktop/stable/longbridge-v#{version.csv.first}-#{version.csv.second}-macos-#{arch}.dmg"
  name "Longbridge"
  name "长桥证券"
  desc "Native cross-market securities trading client"
  homepage "https://longbridge.com/desktop/"

  livecheck do
    url "https://assets.lbkrs.com/github/release/longbridge-desktop/stable/latest.json"
    strategy :json do |json|
      json["assets"].filter_map do |asset|
        match = asset["name"].match(/longbridge-v(\d+(?:\.\d+)+)-g([0-9a-f]+)-macos-aarch64\.dmg/)
        "#{match[1]},g#{match[2]}" if match
      end
    end
  end

  auto_updates true
  depends_on :macos

  app "Longbridge.app"

  uninstall quit: "com.longbridge.app.desktop"

  zap trash: [
    "~/Library/Application Support/Longbridge",
    "~/Library/Caches/com.longbridge.app.desktop",
    "~/Library/Caches/longbridge",
    "~/Library/HTTPStorages/com.longbridge.app.desktop.binarycookies",
    "~/Library/Logs/Longbridge",
    "~/Library/Preferences/com.longbridge.app.desktop.plist",
    "~/Library/Saved Application State/com.longbridge.app.desktop.savedState",
    "~/Library/WebKit/com.longbridge.app.desktop",
  ]
end
