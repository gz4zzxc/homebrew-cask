cask "lobehub" do
  arch arm: "-arm64"

  version "1.142.8"
  sha256 arm:   "46316e7481ce9fae27fb72e476dd5eae893fc701332a52398b7a64b56c6f13f0",
         intel: "89c976edcc4bf5513ca1cc2ecf73711c0b866e8c805146d68d050f256b8e17a5"

  on_arm do
    url "https://github.com/lobehub/lobe-chat/releases/download/v#{version}/LobeHub-Beta-#{version}#{arch}.zip",
        verified: "github.com/lobehub/lobe-chat/"
  end
  on_intel do
    url "https://github.com/lobehub/lobe-chat/releases/download/v#{version}/LobeHub-Beta-#{version}.dmg",
        verified: "github.com/lobehub/lobe-chat/"
  end

  name "LobeHub"
  desc "AI Chat application with multiple model support"
  homepage "https://github.com/lobehub/lobe-chat"

  auto_updates true
  depends_on macos: ">= :high_sierra"

  app "LobeHub.app"

  zap trash: [
    "~/Library/Application Support/LobeHub",
    "~/Library/Preferences/com.lobehub.LobeHub.plist",
    "~/Library/Saved Application State/com.lobehub.LobeHub.savedState",
  ]
end
