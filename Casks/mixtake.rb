cask "mixtake" do
  version "0.1.0"
  sha256 "20f8045b1fa6d5adf8bd54a9c5220e4ad77e84f09fd80f646c9c4041f27f0c4e"

  url "https://github.com/jdel/MixTake/releases/download/v#{version}/MixTake_#{version}_macos.zip",
      verified: "github.com/jdel/MixTake/"
  name "MixTake"
  desc "Record video with multichannel Core Audio and live Audio Unit effects"
  homepage "https://github.com/jdel/MixTake"

  depends_on arch: :arm64
  app "MixTake.app"

  # MixTake is ad-hoc signed but not notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/MixTake.app"]
  end
end
