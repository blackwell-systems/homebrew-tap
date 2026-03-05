class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.14.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.14.0/claudewatch_0.14.0_darwin_arm64.tar.gz"
      sha256 "df3ccbfd11169bae00756cd2513b0d06abaad74057a892d729c512c7f6be1001"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.14.0/claudewatch_0.14.0_darwin_amd64.tar.gz"
      sha256 "c0a41e7ef1075126d3b9c286053cde751a09d7df5b02afad3078d5968dea5a59"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.14.0/claudewatch_0.14.0_linux_arm64.tar.gz"
      sha256 "675f820755623e9ac80ad992763382eb4719be039d4b74ecc42872c252d41277"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.14.0/claudewatch_0.14.0_linux_amd64.tar.gz"
      sha256 "80acbda15d4642c60bbf447091a7d04400cfbd3248ebc5fd9d4552df30c65580"
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
