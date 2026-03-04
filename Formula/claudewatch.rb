class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.11.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.11.0/claudewatch_0.11.0_darwin_arm64.tar.gz"
      sha256 "d33a4c024fdab8cd9dd62359a2173025fcaaf0c6682bfbcf386408e5fe651606"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.11.0/claudewatch_0.11.0_darwin_amd64.tar.gz"
      sha256 "20d611c54daf8d9e27c8de8a5e7766a58054b379160a11591a2812c6c1f0e533"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.11.0/claudewatch_0.11.0_linux_arm64.tar.gz"
      sha256 "996adc5915a27cafe8461f061c6964e27b2b7117d151fd69ecfcc96d1827746f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.11.0/claudewatch_0.11.0_linux_amd64.tar.gz"
      sha256 "dd9b3f6502944fd5d0379b0f7e5ce61e26d699774ad901334218ffe35176e38c"
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
