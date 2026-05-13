cask "quick-outline" do
  version "2.3.0"
  sha256 "c06140a66615e04dc6c3ac2301db734e000d4425d48ce16911c849a2393ac034"

  url "https://github.com/ririv/QuickOutline/releases/download/#{version}/QuickOutline-#{version}-macos.dmg"
  name "QuickOutline"
  name "PDF目录编辑器"
  desc "PDF 目录/书签编辑工具，支持添加、编辑和导出 PDF 书签"
  homepage "https://github.com/ririv/QuickOutline"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on :macos

  app "QuickOutline.app"

  zap trash: [
    "~/Library/Application Support/QuickOutline",
    "~/Library/Caches/QuickOutline",
    "~/Library/Logs/QuickOutline",
    "~/Library/Preferences/QuickOutline",
    "~/Library/Saved Application State/QuickOutline.savedState",
  ]
end
