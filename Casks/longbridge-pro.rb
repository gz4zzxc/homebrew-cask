cask "longbridge-pro" do
  arch arm: "arm64", intel: "x64"

  version "2.38.3"
  sha256 arm:   "8662e2bb38d704d9f6da0b2da87a3f847f2280ae951a56ebf1e57ae90ae87b3c",
         intel: "d3ea4478a57cc4b0515c55e2dced95d470dda105dcea2c554a1eeff22f5a001f"

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
