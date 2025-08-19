cask "lobe-chat" do
  arch arm: "-arm64", intel: "-x64"

  version "1.114.0"
  sha256 arm:   "d30a22b2ac2b427ae509e6d4c6669336ed952594025130846c0a5485b09fa43e",
         intel: "76da2559a3dd38c1b366333970ef9488bc984234f7806859d42edba111d40aa1"

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
