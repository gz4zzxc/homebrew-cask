cask "aliyundrive" do
  arch arm: "-arm64"

  version "6.9.1"
  sha256 arm:   "c01303f9a45e47d49d0dc551745ff22a38aa4b20147f31e5ce50adc91d8f2479",
         intel: "13159c91858923d06c01697ea4ab4dc7a51bc77a54f61f1374441364f060e974"

  url "https://cdn.aliyundrive.net/downloads/apps/desktop/aDrive-#{version}#{arch}.dmg",
      verified:   "cdn.aliyundrive.net/",
      user_agent: :fake
  name "Aliyun Drive"
  name "阿里云盘"
  desc "Personal cloud storage service by Alibaba Group"
  homepage "https://www.aliyundrive.com/"

  # livecheck do
  #   url "https://www.aliyundrive.com/download"
  #   regex(/aDrive[._-]v?(\d+(?:\.\d+)+)(?:-arm64)?\.dmg/i)
  # end

  auto_updates true

  app "aDrive.app"

  zap trash: [
    "~/Library/Application Support/aDrive",
    "~/Library/Preferences/com.alicloud.smartdrive.plist",
    "~/Library/Saved Application State/com.alicloud.smartdrive.savedState",
  ]
end
