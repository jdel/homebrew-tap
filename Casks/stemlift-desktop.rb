cask "stemlift-desktop" do
  version "0.1.0"
  sha256 "81b63e8b76d8830a9ac9434b1689701ffdb8aa8cb551c06622e3bfbd77d0ca6c"

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
