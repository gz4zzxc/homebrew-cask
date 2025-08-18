cask "lobe-chat" do
  arch arm: "-arm64", intel: "-x64"

  version "1.113.2"
  sha256 arm:   "06de2e44c048c548a3f0feec7ded06e8d376e9ecdf66e8ac29de030d94c1b976",
         intel: "b09ef1f5ee9179a3498331e571b65587713685b6ef044c1e4690c93bf6502efb"

  url "https://github.com/lobehub/lobe-chat/releases/download/v#{version}/LobeHub-Beta-#{version}#{arch}.dmg",
      verified: "github.com/lobehub/"
  name "Lobe Chat"
  desc "Open-source AI chat app"
  homepage "https://github.com/lobehub/lobe-chat"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true

  app "LobeHub-Beta.app"
end
