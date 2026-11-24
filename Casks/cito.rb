# Release template. Generate the installable Cask with packaging/release.py.
cask "cito" do
  version "0.22.1"
  sha256 "4c1ced4ee6c7a60fd33b2f240ade2eb808fe35d82d75f700f35b4d7233b23ed8"

  url "https://github.com/Tefx/cito/releases/download/v#{version}/Cito-macos-arm64.zip"
  name "Cito"
  desc "Cross-harness agent and human signaling network"
  homepage "https://tefx.github.io/cito/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Cito.app"
  binary "#{appdir}/Cito.app/Contents/MacOS/Cito", target: "cito"
  binary "#{appdir}/Cito.app/Contents/MacOS/Cito", target: "cito-mcp"

  uninstall quit: "one.tefx.cito"

  zap trash: [
    "~/.cito",
    "~/Applications/Cito.app",
    "~/Library/LaunchAgents/com.tefx.cito.daemon.plist",
  ]
end
