cask "emission-desktop" do
  version "0.3.2"
  sha256 "558e9fe889ef4bb7e9bb9c875bac2d0893a6ba53592e967c21ab07d99770ec9e"

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
