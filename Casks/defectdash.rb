cask "defectdash" do
  version "0.0.4"
  sha256 "09b21cb73cf96ff9dc7b07e78d22f78b0a5c1e71fb163a51ee39f22b1d40c5a4"

  url "https://github.com/Arawn-Davies/DefectDash/releases/download/v#{version}/DefectDash-#{version}-macos-arm64.zip"
  name "DefectDash"
  desc "Ranked Asana defects joined with your local git worktrees: macOS app and terminal UI"
  homepage "https://github.com/Arawn-Davies/DefectDash"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sequoia"
  depends_on arch: :arm64

  app "DefectDash.app"
  binary "defectdash"

  # Both binaries are ad-hoc signed and not notarized; without this Gatekeeper refuses to run them.
  # The app lives in appdir; the terminal binary stays in the Caskroom and is symlinked into bin.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/DefectDash.app"],
                   sudo: false
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{staged_path}/defectdash"],
                   sudo: false,
                   must_succeed: false
  end

  zap trash: "~/Library/Preferences/io.github.arawn-davies.defectdash.plist"
end
