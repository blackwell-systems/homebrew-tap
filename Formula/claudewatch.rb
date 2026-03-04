class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.12.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.12.0/claudewatch_0.12.0_darwin_arm64.tar.gz"
      sha256 "569d75419ecff63ab57a783235d3d2bd9da92d0217df2e13401a4d232f502126"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.12.0/claudewatch_0.12.0_darwin_amd64.tar.gz"
      sha256 "0a3e01ba3ad9adca64742ef4b678235ab7672a97f993973f2dc15e95555fb534"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.12.0/claudewatch_0.12.0_linux_arm64.tar.gz"
      sha256 "cf97627a184ec87f46bf832cba2fed33caa04bf08bac2af3746adea6891e0c48"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.12.0/claudewatch_0.12.0_linux_amd64.tar.gz"
      sha256 "627fd47740aac72f7e229dbf9fdccfa0b046f23219e56ceed54096c9d039f8fa"
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
