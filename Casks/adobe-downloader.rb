cask "adobe-downloader" do
  version "2.1.3"
  sha256 "f37ca913c147e8e9f85df63281dd6eb4f42a2c007a35d85a37e53c2ade8691d2"

  url "https://github.com/X1a0He/Adobe-Downloader/releases/download/#{version}/Adobe.Downloader.dmg"
  name "Adobe Downloader"
  desc "Tool to download Adobe apps (Creative Cloud alternative)"
  homepage "https://github.com/X1a0He/Adobe-Downloader"

  # livecheck do
  #   url :url
  #   strategy :github_latest
  # end

  depends_on macos: ">= :ventura"

  app "Adobe Downloader.app"

  zap trash: [
    "~/Library/Application Support/Adobe Downloader",
    "~/Library/Preferences/com.x1a0he.Adobe-Downloader.plist",
    "~/Library/Saved Application State/com.x1a0he.Adobe-Downloader.savedState",
  ]
end
