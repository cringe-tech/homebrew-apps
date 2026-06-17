# homebrew-apps

A [Homebrew](https://brew.sh) tap for [cringe-tech](https://github.com/cringe-tech) apps.

## TinyStats

A tiny, native macOS menu bar system monitor — read-only, HIG-friendly, light on CPU and battery.

```sh
brew install --cask cringe-tech/apps/tinystats
```

Or tap first, then install by name:

```sh
brew tap cringe-tech/apps
brew install --cask tinystats
```

Source, releases and issues: <https://github.com/cringe-tech/tiny-stats>

> The build is ad-hoc signed (not yet notarized). The cask strips the download quarantine in
> `postflight`, so it launches without a Gatekeeper prompt.
