cask "adobe-downloader" do
  version "2.1.0"
  sha256 "e770b14fb636aef555bf832d0a81dc7c3ac38f4cf9b06f96d1fff5b5b8900c27"

  url "https://github.com/X1a0He/Adobe-Downloader/releases/download/#{version}/Adobe.Downloader.dmg"
  name "Adobe Downloader"
  desc "Tool to download Adobe apps (Creative Cloud alternative)"
  homepage "https://github.com/X1a0He/Adobe-Downloader"

  depends_on macos: ">= :ventura"

  app "Adobe Downloader.app"

  zap trash: [
    "~/Library/Application Support/Adobe Downloader",
    "~/Library/Preferences/com.x1a0he.Adobe-Downloader.plist",
    "~/Library/Saved Application State/com.x1a0he.Adobe-Downloader.savedState",
  ]
end
