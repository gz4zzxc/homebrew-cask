cask "adobe-downloader" do
  version "2.1.5"
  sha256 "11b15673a8568f58bf7e237203aea6c2b8277c353dc60a51b7282f5ec0c64e20"

  url "https://github.com/X1a0He/Adobe-Downloader/releases/download/#{version}/Adobe.Downloader.dmg",
      verified: "github.com/X1a0He/Adobe-Downloader/"
  name "Adobe Downloader"
  desc "Tool to download Adobe apps (Creative Cloud alternative)"
  homepage "https://github.com/X1a0He/Adobe-Downloader"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: ">= :ventura"

  app "Adobe Downloader.app"

  zap trash: [
    "~/Library/Application Support/Adobe Downloader",
    "~/Library/Preferences/com.x1a0he.Adobe-Downloader.plist",
    "~/Library/Saved Application State/com.x1a0he.Adobe-Downloader.savedState",
  ]
end
