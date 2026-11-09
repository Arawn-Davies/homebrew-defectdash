# homebrew-defectdash

Homebrew tap for [DefectDash](https://github.com/Arawn-Davies/DefectDash): ranked Asana
defects joined with your local git worktrees, as a macOS app and a terminal UI.

```sh
brew tap Arawn-Davies/defectdash
brew install --cask defectdash
```

Installs `DefectDash.app` into Applications and the `defectdash` terminal UI onto your
path. The build is ad-hoc signed (not notarized); the cask removes the quarantine
flag after install so the app opens normally. If you prefer to keep Homebrew's
default behaviour, install with `--no-quarantine` yourself instead.

Upgrade with `brew upgrade --cask defectdash`.
