cask "stemlift" do
  version "0.1.0"
  sha256 "ecd463fd651bfb53067c508bdd0fbd714c96fee56d7ae5b6d4a19d48e4e0d456"

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
