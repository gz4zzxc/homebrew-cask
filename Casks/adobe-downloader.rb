cask "adobe-downloader" do
  version "2.1.2"
  sha256 "97215c113acf737151cb5dd15ed7badea50b7c269eaac427e6ff42388ef6e794"

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
