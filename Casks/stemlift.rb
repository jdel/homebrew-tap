cask "stemlift" do
  version "0.1.0"
  sha256 "30a47a372d7e4cc50ab21f64d2e9230d85a4ca527792b76e6307b3bfbac4f0ea"

  url "https://github.com/jdel/StemLift/releases/download/v#{version}/stemlift-#{version}-darwin-arm64.tar.gz",
      verified: "github.com/jdel/StemLift/"
  name "StemLift"
  desc "Extract audio stems and create backing tracks with Demucs"
  homepage "https://github.com/jdel/StemLift"

  depends_on arch: :arm64
  binary "stemlift"

  # Binary is unsigned; strip quarantine so Gatekeeper allows first run.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/stemlift"]
  end
end
