cask "cito" do
  version "0.19.0"
  sha256 "e941f611f25f5f0889f2aaccc912b5a7748a607a19dff9499759858657d8fdcc"

  url "https://github.com/Tefx/cito/releases/download/v#{version}/Cito-macos-arm64.zip"
  name "Cito"
  desc "Cross-harness agent and human signaling network for macOS"
  homepage "https://tefx.github.io/cito/"

  depends_on arch: :arm64
  depends_on macos: :ventura

  app "Cito.app"
  binary "#{appdir}/Cito.app/Contents/MacOS/Cito", target: "cito"
  binary "#{appdir}/Cito.app/Contents/MacOS/Cito", target: "cito-mcp"

  uninstall_preflight do
    system_command "#{appdir}/Cito.app/Contents/MacOS/Cito",
                   args: ["setup", "--uninstall"]
  rescue StandardError
    nil
  end

  uninstall quit: "one.tefx.cito"

  zap trash: [
    "~/.cito",
    "~/Library/LaunchAgents/com.tefx.cito.daemon.plist",
    "~/Applications/Cito.app",
  ]
end
