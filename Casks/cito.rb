# Release template. Generate the installable Cask with packaging/release.py.
cask "cito" do
  version "0.22.0"
  sha256 "3e8ba34e6d59d56a8b13568606443507aac259f2aa2f223ea7895a3fa506083d"

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
