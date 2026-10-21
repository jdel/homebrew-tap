cask "stemlift-desktop" do
  version "0.1.1"
  sha256 "ba9c3f2fae16d24ef76e4331356f3695db39b04de32883b13f9d41ca0b76348b"

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
