cask "vibecheck" do
  version "1.5"
  sha256 "f3020254d8194d7c90bf94a3c38d6b4b363e98f582e56f34ddd0de4dcddcbad3"

  url "https://github.com/saroj-shahi/vibecheck/releases/download/v#{version}/VibeCheck.zip"
  name "VibeCheck"
  desc "Menu bar system monitor that tells you if your computer is vibing or cooked"
  homepage "https://github.com/saroj-shahi/vibecheck"

  depends_on macos: ">= :sonoma"

  app "VibeCheck.app"

  # Not notarized (no paid Developer ID): clear the quarantine flag Homebrew sets, or Gatekeeper blocks the app.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/VibeCheck.app"]
  end

  uninstall quit: "local.vibecheck.app"

  zap trash: [
    "~/Library/Group Containers/77HKFF78Z8.local.vibecheck",
    "~/Library/Preferences/local.vibecheck.app.plist",
  ]
end
