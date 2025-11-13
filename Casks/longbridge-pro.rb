cask "longbridge-pro" do
  arch arm: "arm64", intel: "x64"

  version "2.34.1"
  sha256 arm:   "7f8c92ade5c3308381b2561004743a7b0f2a844fcfd1f4960fceaed66b5b593c",
         intel: "a1aea18ac2df6a4f600b2d4f9f7b08f9c354657a0f6572ba35555ec20cff518c"

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
