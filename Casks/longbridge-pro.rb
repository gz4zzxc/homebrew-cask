cask "longbridge-pro" do
  arch arm: "arm64", intel: "x64"

  version "2.38.6"
  sha256 arm:   "f49c1f5358f6d47e3cc25495a0dfd3d55f514c5eded1971e4710e5a9f543b976",
         intel: "d36819329e58a00b0544262e393644ccb65442dd1ea3111de5a0c4015a4505d8"

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
  depends_on macos: :big_sur

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
