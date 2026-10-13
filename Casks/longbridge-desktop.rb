cask "longbridge-desktop" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.0.0"
  sha256 arm:   "7fcc395048fcc92a6d1c034eeb283d0c6c87dda648c0abcaad619b1b069643c8",
         intel: "8d0e917af40370685d117c29ca727783811bed10c5091c14d8171b1e73add767"

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
