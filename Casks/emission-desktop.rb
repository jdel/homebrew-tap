cask "emission-desktop" do
  version "0.4.0"
  sha256 "3c375393a5aa7e03237eb79a0baa6f20029eabe934629cac2b904d7b55fbd6e4"

  url "https://github.com/jdel/emission/releases/download/v#{version}/Emission_#{version}_macos.zip",
      verified: "github.com/jdel/emission/"
  name "Emission"
  desc "Spoof BitTorrent tracker announces to boost your ratio"
  homepage "https://github.com/jdel/emission"

  depends_on arch: :arm64
  app "Emission.app"

  # `brew uninstall --zap emission-desktop` removes the app's data dir too.
  zap trash: "~/Library/Application Support/emission-desktop"

  # App is unsigned; strip quarantine so Gatekeeper allows first run.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Emission.app"]
  end
end
