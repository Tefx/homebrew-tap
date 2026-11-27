# Release template. Generate the installable Cask with packaging/release.py.
cask "cito" do
  version "0.23.0"
  sha256 "52f62361e1e275898948a0938af57ca90d598cdb163c64c2c1dbac2fbfd0be43"

  url "https://github.com/Tefx/cito/releases/download/v#{version}/Cito-macos-arm64.zip"
  name "Cito"
  desc "Cross-harness agent and human signaling network"
  homepage "https://tefx.github.io/cito/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Cito.app"
  binary "#{appdir}/Cito.app/Contents/MacOS/Cito", target: "cito"
  binary "#{appdir}/Cito.app/Contents/MacOS/Cito", target: "cito-mcp"

  uninstall launchctl: "com.tefx.cito.daemon",
            quit:      ["one.tefx.cito", "one.tefx.cito.ui"],
            delete:    "~/Library/LaunchAgents/com.tefx.cito.daemon.plist"

  zap trash: "~/.cito"
end
