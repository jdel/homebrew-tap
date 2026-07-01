cask "emission-desktop" do
  version "0.3.3"
  sha256 "4c2da685760508bfc77c295098f047f9dc1a9e73212e7910ac29c95e5639b113"

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
