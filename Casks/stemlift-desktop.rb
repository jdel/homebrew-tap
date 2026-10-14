cask "stemlift-desktop" do
  version "0.1.0"
  sha256 "0436f60fa8786d1549efebac9c57ffb9cb0c3a69ad3ad95c7ef4fd49fee22856"

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
