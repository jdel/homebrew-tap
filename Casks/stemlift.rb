cask "stemlift" do
  version "0.1.0"
  sha256 "0de46b80d48f80fb7aee0697a1a3d4bc9ed30b0ac30a9dab5bf228f9b5c14f2a"

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
