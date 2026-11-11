# Release template. Generate the installable Cask with packaging/release.py.
cask "cito" do
  version "0.21.1"
  sha256 "85e8cb5b02ef11ac4b377c92d90d3f0761021f0f5fbcd0ceaf9996ee57b1ef63"

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
