# Release template. Generate the installable Cask with packaging/release.py.
cask "cito" do
  version "0.22.3"
  sha256 "1fd5884ac38d18cdd5d59c0bfa1aa38ca866cf90ddb3955eb4a861fd8e673fcd"

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
