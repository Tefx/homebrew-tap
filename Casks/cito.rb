cask "cito" do
  version "0.20.2"
  sha256 "8e9d14eea5b1d310b392752817d6d48c15fdfee2723080b6ee4b515f1c160625"

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
