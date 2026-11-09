cask "cito" do
  version "0.19.0"
  sha256 "4a0f0ab818f9debbc158a88f1dd2dc249ff10c1a83a9c257f352cf521895c468"

  url "https://github.com/Tefx/cito/releases/download/v#{version}/Cito-macos-arm64.zip"
  name "Cito"
  desc "Cross-harness agent and human signaling network for macOS"
  homepage "https://tefx.github.io/cito/"

  depends_on arch: :arm64
  depends_on macos: ">= :ventura"

  app "Cito.app"
  binary "#{appdir}/Cito.app/Contents/MacOS/Cito", target: "cito"
  binary "#{appdir}/Cito.app/Contents/MacOS/Cito", target: "cito-mcp"

  uninstall quit: "one.tefx.cito"

  zap trash: [
    "~/.cito",
    "~/Library/LaunchAgents/com.tefx.cito.daemon.plist",
  ]
end
