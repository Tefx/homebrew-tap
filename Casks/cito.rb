cask "cito" do
  version "0.20.3"
  sha256 "500160480383486ec1738841133e4fef147f8bc955252a87c5bc68f430f1dd5b"

  url "https://github.com/Tefx/cito/releases/download/v#{version}/Cito-macos-arm64.zip"
  name "Cito"
  desc "Cross-harness agent and human signaling network for macOS"
  homepage "https://tefx.github.io/cito/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Cito.app"
  binary "#{appdir}/Cito.app/Contents/MacOS/Cito", target: "cito"
  binary "#{appdir}/Cito.app/Contents/MacOS/Cito", target: "cito-mcp"

  uninstall quit: "one.tefx.cito"

  zap trash: [
    "~/.cito",
    "~/Library/LaunchAgents/com.tefx.cito.daemon.plist",
    "~/Applications/Cito.app",
  ]
end
