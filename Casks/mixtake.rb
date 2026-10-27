cask "mixtake" do
  version "0.0.1"
  sha256 "346374f85a9f4001aa659e1cacafb6eb9efe3e2387ef7bf56c980863d26b2799"

  url "https://github.com/jdel/CoverRecorder/releases/download/v#{version}/MixTake_#{version}_macos.zip",
      verified: "github.com/jdel/CoverRecorder/"
  name "MixTake"
  desc "Record video with multichannel Core Audio and live Audio Unit effects"
  homepage "https://github.com/jdel/CoverRecorder"

  depends_on arch: :arm64
  app "MixTake.app"

  # MixTake is ad-hoc signed but not notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MixTake.app"]
  end
end
