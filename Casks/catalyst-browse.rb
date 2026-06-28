cask "catalyst-browse" do
  version "2026.1,XIe238f15b"
  sha256 "04f6eeb44cb7325f89ceba24ab50af1412dd126762494f07816dfd28b10ed930"

  url "https://di.update.sony.net/NEX/#{version.csv.second}/Catalyst_Browse.dmg?version=#{version.csv.first}"
  name "Sony Catalyst Browse"
  name "Catalyst Browse"
  desc "Professional media browser and metadata viewer for video production workflows"
  homepage "https://www.sony.net/catalyst"

  livecheck do
    url "https://www.sony.com/electronics/support/articles/CCCT03000"
    regex(/Catalyst\s+Browse\s+(\d+(?:\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: :monterey

  pkg "Catalyst Browse #{version.csv.first}.pkg"

  uninstall pkgutil: "com.sony.SonyCreativeSoftware.Browse"

  zap trash: [
    "~/Library/Application Support/Catalyst Browse",
    "~/Library/Application Support/Sony/Catalyst Browse",
    "~/Library/Caches/com.sony.CatalystBrowse",
    "~/Library/Logs/Catalyst Browse",
    "~/Library/Preferences/com.sony.Catalyst.plist",
    "~/Library/Preferences/com.sony.CatalystBrowse.plist",
    "~/Library/Preferences/com.sony.SonyCreativeSoftware.Browse.plist",
    "~/Library/Saved Application State/com.sony.CatalystBrowse.savedState",
  ]
end
