cask "defectdash" do
  version "0.0.4"
  sha256 "43be88434c93cc48bbb9130baee3d99d7875e3e56d006cfbb0b95d539c07ca29"

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

  # The bundle is ad-hoc signed and not notarized; without this Gatekeeper refuses to open it.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/DefectDash.app"],
                   sudo: false
  end

  zap trash: "~/Library/Preferences/io.github.arawn-davies.defectdash.plist"
end
