cask "stemlift" do
  version "0.1.1"
  sha256 "aaaa7dc805bbdba35fd48de3d1e9a13621b4a3c7d1cd94eb3ab6d292aced1f3c"

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
