cask "catalyst-browse" do
  version "2025.2"
  sha256 "24bf06358ea7b9c359b934599786a5f9b97e970b7ebbcc3685d019c2c2bbadf1"

  url "https://di.update.sony.net/NEX/b579a2667c/Catalyst_Browse.dmg",
      verified: "di.update.sony.net/"
  name "Sony Catalyst Browse"
  name "Catalyst Browse"
  desc "Professional media browser and metadata viewer for video production workflows"
  homepage "https://www.sony.com/electronics/support/articles/CCCT03000"

  # livecheck do
  #   url "https://www.sony.com/electronics/support/articles/CCCT03000"
  #   regex(/Catalyst\s+Browse\s+(\d+(?:\.\d+)+)/i)
  # end

  auto_updates true
  depends_on macos: ">= :monterey"

  pkg "Catalyst Browse #{version}.pkg"

  postflight do
    # Create application support directory if it doesn't exist
    support_dir = "#{Dir.home}/Library/Application Support/Catalyst Browse"
    system_command "/bin/mkdir", args: ["-p", support_dir]

    # Try to prevent first-run tutorial by creating multiple marker files
    marker_files = [
      "#{support_dir}/.tutorial_shown",
      "#{support_dir}/.first_launch_done",
      "#{support_dir}/.welcome_shown",
      "#{support_dir}/tutorial_completed",
    ]
    marker_files.each do |file|
      system_command "/usr/bin/touch", args: [file]
    end

    # Set comprehensive preferences to disable first-run behavior
    prefs = [
      ["FirstLaunch", "false"],
      ["ShowTutorial", "false"],
      ["WelcomeShown", "true"],
      ["TutorialCompleted", "true"],
      ["FirstRun", "false"],
      ["ShowWelcome", "false"],
      ["InitialSetupDone", "true"],
      ["HasLaunchedBefore", "true"],
    ]

    prefs.each do |key, value|
      system_command "/usr/bin/defaults", args: ["write", "com.sony.Catalyst", key, "-bool", value]
    end

    # Also try setting for potential alternative preference domains
    alt_domains = ["com.sony.CatalystBrowse", "com.sony.SonyCreativeSoftware.Browse"]
    alt_domains.each do |domain|
      prefs.each do |key, value|
        system_command "/usr/bin/defaults", args: ["write", domain, key, "-bool", value], print_stderr: false
      end
    end
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
      Sony Catalyst Browse may open a tutorial webpage on first launch despite
      preventive measures. If this happens:
      1. Simply close the browser tab/window
      2. The tutorial should not appear on subsequent launches

      This behavior is from Sony's application and cannot be completely prevented
      during installation.
    EOS
  end
end
