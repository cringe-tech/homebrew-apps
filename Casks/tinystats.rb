cask "tinystats" do
  version "0.2.3"
  sha256 "910a4d70aae7bee8ca6147d263ef0c4ec96d7f2972fd349f9cc26e6017b5ca15"

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
