cask "catalyst-browse" do
  version "2025.2"
  sha256 "24bf06358ea7b9c359b934599786a5f9b97e970b7ebbcc3685d019c2c2bbadf1"

  url "https://di.update.sony.net/NEX/b579a2667c/Catalyst_Browse.dmg",
      verified: "di.update.sony.net/"
  name "Sony Catalyst Browse"
  name "Catalyst Browse"
  desc "Professional media browser and metadata viewer for video production workflows"
  homepage "https://www.sony.com/electronics/support/articles/CCCT03000"

  livecheck do
    url "https://www.sony.com/electronics/support/articles/CCCT03000"
    regex(/Catalyst\s+Browse\s+(\d+(?:\.\d+)+)/i)
  end

  auto_updates true
  depends_on macos: ">= :monterey"

  pkg "Catalyst Browse #{version}.pkg"

  postflight do
    # Create application support directory if it doesn't exist
    support_dir = "#{Dir.home}/Library/Application Support/Catalyst Browse"
    system_command "/bin/mkdir", args: ["-p", support_dir]

    # Try to prevent first-run tutorial by creating a marker file
    # This is a best-effort attempt to avoid the automatic browser opening
    marker_file = "#{support_dir}/.tutorial_shown"
    system_command "/usr/bin/touch", args: [marker_file]

    # Set some preferences to potentially disable first-run behavior
    system_command "/usr/bin/defaults", args: ["write", "com.sony.Catalyst", "FirstLaunch", "-bool", "false"]
    system_command "/usr/bin/defaults", args: ["write", "com.sony.Catalyst", "ShowTutorial", "-bool", "false"]
  end

  uninstall pkgutil: "com.sony.SonyCreativeSoftware.Browse"

  zap trash: [
    "~/Library/Application Support/Catalyst Browse",
    "~/Library/Caches/com.sony.CatalystBrowse",
    "~/Library/Logs/Catalyst Browse",
    "~/Library/Preferences/com.sony.CatalystBrowse.plist",
    "~/Library/Saved Application State/com.sony.CatalystBrowse.savedState",
  ]

  caveats do
    <<~EOS
      Note: Sony Catalyst Browse may automatically open a tutorial webpage
      (https://www.sony.com/electronics/support/articles/CCCT06000) when first launched.
      This is normal behavior and can be safely closed.
    EOS
  end
end
