cask "adobe-downloader" do
  version "2.1.4"
  sha256 "34fd86dc1d4ff3b04c8d7d6c12e9174e5e9a75904ad069c04a0e05e7fa761cac"

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
