cask "adobe-downloader" do
  version "2.2.0"
  sha256 "44b4bfd5b1e80d5de50624d76f8a98a3549bff0c923db8acc021080810c1de77"

  url "https://github.com/X1a0He/Adobe-Downloader/releases/download/#{version}/Adobe.Downloader.dmg",
      verified: "github.com/X1a0He/Adobe-Downloader/"
  name "Adobe Downloader"
  desc "Tool to download and install Adobe Creative Cloud applications"
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
    "~/Library/Caches/com.x1a0he.Adobe-Downloader",
    "~/Library/Preferences/com.x1a0he.Adobe-Downloader.plist",
    "~/Library/Saved Application State/com.x1a0he.Adobe-Downloader.savedState",
  ]
end
