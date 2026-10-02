cask "opencode-desktop-v2" do
  version "2.0.22"
  sha256 "2a9a049bae3478808664dd201ac3c62883e5b3c2a2e0e766c4e8f773ce080aa9"

  url "https://opencode.ai/files/bin/#{version}/opencode-desktop-mac-arm64.dmg"
  name "OpenCode Desktop V2"
  desc "AI coding agent desktop client"
  homepage "https://opencode.ai/v2/docs"

  livecheck do
    url "https://opencode.ai/download/stable/darwin-aarch64-dmg"
    regex(%r{/files/bin/(\d+(?:\.\d+)+)/opencode-desktop-mac-arm64\.dmg}i)
    strategy :header_match do |headers, regex|
      match = headers["location"]&.match(regex)
      next if match.blank?

      match[1]
    end
  end

  auto_updates true
  conflicts_with cask: "opencode-desktop"
  depends_on arch: :arm64
  depends_on macos: :ventura

  app "OpenCode.app"

  zap trash: [
    "~/Library/Application Support/ai.opencode.desktop",
    "~/Library/Application Support/CrashReporter/OpenCode Helper_*.plist",
    "~/Library/Application Support/CrashReporter/OpenCode_*.plist",
    "~/Library/Preferences/ai.opencode.desktop.plist",
    "~/Library/WebKit/ai.opencode.desktop",
  ]
end
