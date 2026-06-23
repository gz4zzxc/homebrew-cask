cask "adobe-downloader" do
  version "3.1.0"
  sha256 "5a402946fc2aee56d9d8dc7eb3d038e8521ee75de8e5af4c8c2edcf02ea79843"

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
  depends_on macos: :ventura

  app "Adobe Downloader.app"

  zap trash: [
    "~/Library/Application Support/Adobe Downloader",
    "~/Library/Caches/com.x1a0he.Adobe-Downloader",
    "~/Library/Preferences/com.x1a0he.Adobe-Downloader.plist",
    "~/Library/Saved Application State/com.x1a0he.Adobe-Downloader.savedState",
  ]
end
