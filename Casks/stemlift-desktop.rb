cask "stemlift-desktop" do
  version "0.1.0"
  sha256 "5bfab2f69a269e90bc4aba1f02db360407a568e3601a72b644a80e48876edcf4"

  url "https://github.com/jdel/StemLift/releases/download/v#{version}/StemLift_#{version}_macos.zip",
      verified: "github.com/jdel/StemLift/"
  name "StemLift"
  desc "Extract audio stems and create backing tracks with Demucs"
  homepage "https://github.com/jdel/StemLift"

  depends_on arch: :arm64
  app "StemLift.app"

  # App is unsigned; strip quarantine so Gatekeeper allows first run.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/StemLift.app"]
  end
end
