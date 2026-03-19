cask "longbridge-pro" do
  arch arm: "arm64", intel: "x64"

  version "2.36.5"
  sha256 arm:   "ba591b4e678e161c5930da52c5b5b9ea74bcd1b92b3ef3c059b079aff8f86d62",
         intel: "56dd2cb3dca50342331e25d708cec847b1362224cc5e7d98d1c1b4d66ebefdd5"

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
