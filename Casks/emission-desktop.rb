cask "emission-desktop" do
  version "0.3.1"
  sha256 "c04549ac53a8864b91cd262a8ba024e0cf1020f3d5503bf8930a215601338c6b"

  url "https://github.com/jdel/emission/releases/download/v#{version}/Emission_#{version}_macos.zip",
      verified: "github.com/jdel/emission/"
  name "Emission"
  desc "Spoof BitTorrent tracker announces to boost your ratio"
  homepage "https://github.com/jdel/emission"

  depends_on arch: :arm64
  app "Emission.app"

  # App is unsigned; strip quarantine so Gatekeeper allows first run.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Emission.app"]
  end
end
