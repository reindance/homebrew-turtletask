cask "turtletask" do
  version "0.2.5"
  sha256 "b839191752972ade8162aa5bea35200ab1fdbcc358f0e26ec3d354ebb8692f2e"

  url "https://github.com/reindance/homebrew-turtletask/releases/download/desktop-v#{version}/TurtleTask_#{version}_universal.dmg"
  name "TurtleTask"
  desc "Spotlight-style palette for the TurtleTask task board"
  homepage "https://turtletask.app/"

  # The app updates itself; brew upgrade leaves it alone. macOS only, with
  # no version floor: Homebrew removes the symbols for the versions it no
  # longer supports ( broke installs on 2026-09-16), and any
  # macOS that can run a current Homebrew can run the app.
  auto_updates true
  depends_on :macos

  app "TurtleTask.app"

  zap trash: [
    "~/Library/Application Support/app.turtletask.desktop",
    "~/Library/Caches/app.turtletask.desktop",
    "~/Library/Saved Application State/app.turtletask.desktop.savedState",
    "~/Library/WebKit/app.turtletask.desktop",
  ]
end
