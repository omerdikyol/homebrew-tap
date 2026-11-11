cask "fener" do
  version "0.1.0"
  sha256 "dd49cd54259b2972b90ae2274e8c7f9bb9d58cd72a846ccbb0eb695eaa2c475f"

  url "https://github.com/omerdikyol/fener/releases/download/v#{version}/fener-#{version}.dmg"
  name "fener"
  desc "Keyboard launcher configured in plain text"
  homepage "https://fener.omerdikyol.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

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

    Icons need a Nerd Font. If you have none:
      brew install --cask font-jetbrains-mono-nerd-font
  EOS
end
