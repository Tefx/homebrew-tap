cask "cito" do
  version "0.20.3"
  sha256 "ee1c94676031b941e253846b40f10fe9ef8bcb256ccbe474dbbc4fd1d445d272"

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
