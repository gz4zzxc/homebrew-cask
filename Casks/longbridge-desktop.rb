cask "longbridge-desktop" do
  arch arm: "aarch64", intel: "x86_64"

  version "1.1.2"
  sha256 arm:   "5d11818c6d87ffafaad1a56f9e24ddd547520575ebb90c6706c429c2183df622",
         intel: "98041e7e3b8bcd85348c8fad2c688d64927317d959d356058b966ed7c01eff63"

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
