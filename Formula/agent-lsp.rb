class AgentLsp < Formula
  desc "Stateful LSP runtime and MCP server for AI agents — 50 tools across 30 languages"
  homepage "https://github.com/blackwell-systems/agent-lsp"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/agent-lsp/releases/download/v0.1.0/agent-lsp_0.1.0_darwin_arm64.tar.gz"
      sha256 "PLACEHOLDER_darwin_arm64"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/agent-lsp/releases/download/v0.1.0/agent-lsp_0.1.0_darwin_amd64.tar.gz"
      sha256 "PLACEHOLDER_darwin_amd64"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/agent-lsp/releases/download/v0.1.0/agent-lsp_0.1.0_linux_arm64.tar.gz"
      sha256 "PLACEHOLDER_linux_arm64"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/agent-lsp/releases/download/v0.1.0/agent-lsp_0.1.0_linux_amd64.tar.gz"
      sha256 "PLACEHOLDER_linux_amd64"
    end
  end

  def install
    bin.install "agent-lsp"
  end

  def caveats
    <<~EOS
      Install language servers for your stack, then add agent-lsp to your MCP config.

      Quick start (Go + TypeScript):
        go install golang.org/x/tools/gopls@latest
        npm install -g typescript-language-server typescript

      Add to .mcp.json:
        {
          "mcpServers": {
            "lsp": {
              "type": "stdio",
              "command": "agent-lsp",
              "args": ["go:gopls", "typescript:typescript-language-server,--stdio"]
            }
          }
        }

      Documentation: https://github.com/blackwell-systems/agent-lsp
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/agent-lsp --version")
  end
end
