class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.15.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.15.0/claudewatch_0.15.0_darwin_arm64.tar.gz"
      sha256 "b190aa663538a25949614fc28da81c0ac5b0c9d7ca916dde24cf6fb5069365f4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.15.0/claudewatch_0.15.0_darwin_amd64.tar.gz"
      sha256 "d07260e0ad2b3757960b04c668941ee9087a3f551a9c027169abb124bf0bd775"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.15.0/claudewatch_0.15.0_linux_arm64.tar.gz"
      sha256 "b3fc6c88f585d3b3fbe12ccb0bf0198232c16d7cf0546fd51a20d1ebfed52145"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.15.0/claudewatch_0.15.0_linux_amd64.tar.gz"
      sha256 "6e88d82d18ca2a8bddce3aab52c25789f5957ac52f32a437ca6caa69b08b02e1"
    end
  end

  def install
    bin.install "claudewatch"
  end

  def caveats
    <<~EOS
      Get started with claudewatch:

      1. Run setup (configures CLAUDE.md + MCP server):
         claudewatch install

      2. Restart Claude Code to load the MCP server

      3. Scan your Claude sessions to populate metrics:
         claudewatch scan

      4. View metrics and friction patterns:
         claudewatch metrics --days 7
         claudewatch gaps

      Documentation: https://github.com/blackwell-systems/claudewatch#readme
    EOS
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
