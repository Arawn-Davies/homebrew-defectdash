# homebrew-defectdash

Homebrew tap for [DefectDash](https://github.com/Arawn-Davies/DefectDash): ranked Asana
defects joined with your local git worktrees, as a macOS app and a terminal UI.

```sh
brew tap arawn-davies/defectdash
brew trust --cask arawn-davies/defectdash/defectdash   # Homebrew 6: third-party taps are untrusted by default
brew install --cask arawn-davies/defectdash/defectdash
```

Trusting just the cask is the narrower grant; `brew trust arawn-davies/defectdash`
trusts everything in the tap, now and in future. Homebrew 6 also needs the fully
qualified name for casks from untrusted-by-default taps, hence the long form.

Installs `DefectDash.app` into Applications and the `defectdash` terminal UI onto your
path. The build is ad-hoc signed (not notarized); the cask removes the quarantine
flag from both the app and the terminal binary after install so they run normally.
If you prefer to keep Homebrew's default behaviour, install with `--no-quarantine`
yourself instead.

If Gatekeeper still refuses `defectdash`, clear the flag on the real file (the `bin`
entry is a symlink into the Caskroom):

```sh
xattr -d com.apple.quarantine "$(brew --prefix)/Caskroom/defectdash/$(brew list --cask --versions defectdash | cut -d' ' -f2)/defectdash"
```

Upgrade with `brew upgrade --cask defectdash`.
