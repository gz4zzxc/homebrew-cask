cask "catalyst-browse" do
  version "2025.3,4a649a24a5"
  sha256 "b1895ad381f606b7388a822cb313e336dcc708d083d443148f0dc1bfdc7e5875"

  url "https://di.update.sony.net/NEX/#{version.csv.second}/Catalyst_Browse.dmg?version=#{version.csv.first}"
  name "Sony Catalyst Browse"
  name "Catalyst Browse"
  desc "Professional media browser and metadata viewer for video production workflows"
  homepage "https://www.sony.net/catalyst"

  # livecheck do
  #   url "https://www.sony.com/electronics/support/articles/CCCT03000"
  #   regex(/Catalyst\s+Browse\s+(\d+(?:\.\d+)+)/i)
  # end

  auto_updates true
  depends_on macos: :monterey

  pkg "Catalyst Browse #{version.csv.first}.pkg"

  postflight do
    support_dirs = [
      "#{Dir.home}/Library/Application Support/Catalyst Browse",
      "#{Dir.home}/Library/Application Support/Sony/Catalyst Browse/#{version.csv.first}",
    ]
    marker_files = %w[
      .tutorial_shown
      .first_launch_done
      .welcome_shown
      tutorial_completed
    ]

    support_dirs.each do |support_dir|
      system_command "/bin/mkdir", args: ["-p", support_dir]
      marker_files.each do |file|
        system_command "/usr/bin/touch", args: ["#{support_dir}/#{file}"]
      end
    end

    first_run_preferences = {
      "FirstLaunch"       => "false",
      "ShowTutorial"      => "false",
      "WelcomeShown"      => "true",
      "TutorialCompleted" => "true",
      "FirstRun"          => "false",
      "ShowWelcome"       => "false",
      "InitialSetupDone"  => "true",
      "HasLaunchedBefore" => "true",
    }
    preference_domains = %w[
      com.sony.SonyCreativeSoftware.Browse
      com.sony.Catalyst
      com.sony.CatalystBrowse
    ]

    preference_domains.each do |domain|
      first_run_preferences.each do |key, value|
        system_command "/usr/bin/defaults", args: ["write", domain, key, "-bool", value]
      end
    end
  end

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

  caveats do
    <<~EOS
      First-run tutorial is automatically suppressed when installed via brew.
      If you installed manually (via DMG/pkg), run this before first launch:
        for domain in com.sony.SonyCreativeSoftware.Browse com.sony.Catalyst com.sony.CatalystBrowse; do
          defaults write "$domain" FirstLaunch -bool false
          defaults write "$domain" ShowTutorial -bool false
          defaults write "$domain" WelcomeShown -bool true
          defaults write "$domain" TutorialCompleted -bool true
          defaults write "$domain" FirstRun -bool false
          defaults write "$domain" ShowWelcome -bool false
          defaults write "$domain" InitialSetupDone -bool true
          defaults write "$domain" HasLaunchedBefore -bool true
        done
    EOS
  end
end
