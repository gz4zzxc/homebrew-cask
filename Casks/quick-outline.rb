cask "quick-outline" do
  version "2.3.0"
  sha256 "c06140a66615e04dc6c3ac2301db734e000d4425d48ce16911c849a2393ac034"

  url "https://github.com/ririv/QuickOutline/releases/download/#{version}/QuickOutline-#{version}-macos.dmg"
  name "QuickOutline"
  name "PDF目录编辑器"
  desc "PDF outline and bookmark editor"
  homepage "https://github.com/ririv/QuickOutline"

  livecheck do
    url :url
    regex(/^(\d+(?:\.\d+)+)$/i)
    strategy :github_releases
  end

  auto_updates true
  depends_on arch: :arm64
  depends_on :macos

  app "QuickOutline.app"

  zap trash: [
    "~/Library/Preferences/com.ririv.quickoutline.view.plist",
  ]

  caveats <<~EOS
    This application is ad-hoc signed. If macOS blocks it on first launch,
    open it from System Settings > Privacy & Security.
  EOS
end
