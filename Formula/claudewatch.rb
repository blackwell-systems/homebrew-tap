class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.13.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.13.0/claudewatch_0.13.0_darwin_arm64.tar.gz"
      sha256 "2bc79f4e368fc1d85fce4a76a9d14813c41000bde6abca555b61b46a586e77fd"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.13.0/claudewatch_0.13.0_darwin_amd64.tar.gz"
      sha256 "8c49dbef6b6b56a39d78d3a10225cc12a476581653782ff14de5abedce1006cc"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.13.0/claudewatch_0.13.0_linux_arm64.tar.gz"
      sha256 "188974c0044075050f8d17bad77f685363c6abb574ae3b7ff5cb805b0a416ae9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.13.0/claudewatch_0.13.0_linux_amd64.tar.gz"
      sha256 "e292454075448685bab9a6396882debd2fefe24100678e0bf1c8c2159b7616e3"
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
