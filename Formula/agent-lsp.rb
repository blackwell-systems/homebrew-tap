class AgentLsp < Formula
  desc "Stateful LSP runtime and MCP server for AI agents — 50 tools across 30 languages"
  homepage "https://github.com/blackwell-systems/agent-lsp"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/agent-lsp/releases/download/v0.1.1/agent-lsp_darwin_arm64.tar.gz"
      sha256 "5d7f31dd1b80c52991db9fcb4a8c2516e54d53b2d1949f2d5c0ef7f05af5c2e2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/agent-lsp/releases/download/v0.1.1/agent-lsp_darwin_amd64.tar.gz"
      sha256 "a9a25112acceb92c1cdba8ee15f088e8196195b021b6994c812f6ec3f6ad811b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/agent-lsp/releases/download/v0.1.1/agent-lsp_linux_arm64.tar.gz"
      sha256 "c957cc673b2acbbf60318fd2aba4a96720c8fdda35dde161952638e5c51a86eb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/agent-lsp/releases/download/v0.1.1/agent-lsp_linux_amd64.tar.gz"
      sha256 "eaaf21138be188e9a31de076164fcc27374c556f40d55731ed9305053defd874"
    end
  end

  def install
    bin.install "agent-lsp"
  end

  def caveats
    <<~EOS
      Run the setup wizard to auto-detect language servers and configure your AI tool:

        agent-lsp init

      Or manually install language servers and add to .mcp.json:

        go install golang.org/x/tools/gopls@latest
        npm install -g typescript-language-server typescript

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
