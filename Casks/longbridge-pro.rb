cask "longbridge-pro" do
  arch arm: "arm64", intel: "x64"

  version "2.35.4"
  sha256 arm:   "9d5e6425990b527c81c9829e00b02ac271474be3a4539db7db41b071d41ff1bd",
         intel: "e37259a1766e250e967e666e0dc3b80990081e0291b4495cf6525732802d9841"

  url "https://download.lbkrs.com/longbridge-desktop/prod/longbridge-pro-#{version}-mac-#{arch}.dmg",
      verified: "download.lbkrs.com/"
  name "Longbridge Pro"
  name "长桥Pro"
  desc "跨市场券商交易平台"
  homepage "https://longbridge.com/desktop/zh-CN/"

  livecheck do
    url "https://download.wbrks.com/longbridge-desktop/prod/latest-mac.yml"
    strategy :electron_builder
  end

  auto_updates true
  depends_on macos: ">= :big_sur"

  app "Longbridge Pro.app"

  zap trash: [
    "~/Library/Application Support/Longbridge Pro",
    "~/Library/Caches/global.longbridge.app.desktop",
    "~/Library/Caches/global.longbridge.app.desktop.ShipIt",
    "~/Library/HTTPStorages/global.longbridge.app.desktop",
    "~/Library/Logs/Longbridge Pro",
    "~/Library/Preferences/global.longbridge.app.desktop.plist",
  ]
end
