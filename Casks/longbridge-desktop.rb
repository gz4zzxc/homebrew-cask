cask "longbridge-desktop" do
  arch arm: "aarch64", intel: "x86_64"

  version "0.20.1"
  sha256 arm:   "4e47fba4fceb1eee1c2f96d89c52988e7b10a4ec96ef7512d8a1f606981bb915",
         intel: "42fdefbce97effdc5808c55b4df205d3b56fb44f44fb56b964cf83d104f274ac"

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
