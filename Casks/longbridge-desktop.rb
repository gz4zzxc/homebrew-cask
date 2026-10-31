cask "longbridge-desktop" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.1.0"
  sha256 arm:   "1f45cb0bcd32e85189f14d9be330d64087ef13691d6ef6d415fc936d11ef0587",
         intel: "b143cc47c45116dfffc675ff52c65d9762103edf3482ee54dd61694008857a75"

  url "https://assets.lbkrs.com/github/release/longbridge-desktop/stable/longbridge-v#{version}-macos-#{arch}.dmg"
  name "Longbridge"
  name "长桥证券"
  desc "Native cross-market securities trading client"
  homepage "https://longbridge.com/desktop/"

  livecheck do
    url "https://assets.lbkrs.com/github/release/longbridge-desktop/stable/latest.json"
    strategy :json do |json|
      json["version"]
    end
  end

  auto_updates true
  depends_on :macos

  app "Longbridge.app"

  zap trash: [
    "~/Library/Application Support/Longbridge",
    "~/Library/Caches/longbridge",
    "~/Library/Logs/Longbridge",
    "~/Library/Preferences/com.longbridge.app.desktop.plist",
    "~/Library/Saved Application State/com.longbridge.app.desktop.savedState",
  ]
end
