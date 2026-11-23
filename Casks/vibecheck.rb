cask "vibecheck" do
  version "1.6"
  sha256 "290415e7081d5ee480275310187b9e4bfaaa5c2af6b5e10dbc7df62ac8abf52a"

  url "https://github.com/saroj-shahi/vibecheck/releases/download/v#{version}/VibeCheck.zip"
  name "VibeCheck"
  desc "Mac health in one ring, live in the menu bar"
  homepage "https://github.com/saroj-shahi/vibecheck"

  depends_on macos: :sonoma

  app "VibeCheck.app"
  binary "#{appdir}/VibeCheck.app/Contents/Helpers/vibecheck"

  # Not notarized (no paid Developer ID): clear the quarantine flag Homebrew sets, or Gatekeeper blocks the app.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/VibeCheck.app"]
  end

  uninstall quit: [
    "io.github.saroj-shahi.vibecheck",
    "local.vibecheck.app", # 1.5 and earlier
  ]

  zap trash: [
    "~/Library/Application Support/VibeCheck",
    "~/Library/Group Containers/77HKFF78Z8.io.github.saroj-shahi.vibecheck",
    "~/Library/Preferences/io.github.saroj-shahi.vibecheck.plist",
    # 1.5 and earlier
    "~/Library/Group Containers/77HKFF78Z8.local.vibecheck",
    "~/Library/Preferences/local.vibecheck.app.plist",
  ]
end
