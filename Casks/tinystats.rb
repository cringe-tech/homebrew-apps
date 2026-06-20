cask "tinystats" do
  version "0.1.4"
  sha256 "334b8792f5558c1883b23fbd55e191e1f02e96a70d9f09743ad79b0c16e7cf2d"

  url "https://github.com/cringe-tech/tiny-stats/releases/download/v#{version}/TinyStats.dmg"
  name "TinyStats"
  desc "Tiny read-only menu bar system monitor"
  homepage "https://github.com/cringe-tech/tiny-stats"

  depends_on macos: :sonoma

  app "TinyStats.app"

  # The build is ad-hoc signed (not yet notarized), so strip the download quarantine flag,
  # otherwise Gatekeeper blocks first launch. Remove once the app is Developer ID-notarized.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/TinyStats.app"]
  end

  uninstall quit: "com.tinystats.app"

  zap trash: [
    "~/Library/Logs/TinyStats",
    "~/Library/Preferences/com.tinystats.app.plist",
  ]
end
