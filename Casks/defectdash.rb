cask "defectdash" do
  version "0.0.5"
  sha256 "c08c006753b7578dd03a915df19f7944e14ecacbd80dc61bb1ee91cb41e3433a"

  url "https://github.com/Arawn-Davies/DefectDash/releases/download/v#{version}/DefectDash-#{version}-macos-arm64.zip"
  name "DefectDash"
  desc "Ranked Asana defects joined with your local git worktrees: macOS app and terminal UI"
  homepage "https://github.com/Arawn-Davies/DefectDash"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "DefectDash.app"
  binary "defectdash"

  # Both binaries are ad-hoc signed and not notarized; without this Gatekeeper refuses to run them.
  # The app lives in appdir; the terminal binary stays in the Caskroom and is symlinked into bin.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/DefectDash.app"],
                          writable_paths: ["{{appdir}}/DefectDash.app"]
    run "/usr/bin/xattr", args: ["-d", "com.apple.quarantine", "{{staged_path}}/defectdash"],
                          writable_paths: ["{{staged_path}}"]
  end

  zap trash: "~/Library/Preferences/io.github.arawn-davies.defectdash.plist"
end
