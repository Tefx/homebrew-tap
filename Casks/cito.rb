cask "cito" do
  version "0.20.0"
  sha256 "8bd15ad2826b91cdadb83b165a0f44b061a6884ac7bf98fe5937b4abfcbefa01"

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
