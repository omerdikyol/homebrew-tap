cask "fener" do
  version "0.1.0"
  sha256 "413fa0c7f84d712325267f4a0af32830a4751ee6127bb59789799147b795e1dc"

  url "https://github.com/omerdikyol/fener/releases/download/v#{version}/fener-#{version}.zip"
  name "fener"
  desc "Keyboard launcher configured in plain text"
  homepage "https://fener.omerdikyol.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on cask: "font-jetbrains-mono-nerd-font"
  depends_on macos: :sonoma

  app "fener.app"
  binary "#{appdir}/fener.app/Contents/MacOS/fener"

  uninstall quit: "io.github.omerdikyol.fener"

  zap trash: [
    "~/.config/fener",
    "~/Library/Application Support/fener",
    "~/Library/Caches/fener",
    "~/Library/Logs/fener",
  ]

  caveats <<~EOS
    fener's default shortcut is Cmd+Space, which Spotlight uses until you turn it off in
    System Settings > Keyboard > Keyboard Shortcuts > Spotlight. Or pick another shortcut in
    fener Settings. Open fener once to start it; it adds itself to Login Items.
  EOS
end
