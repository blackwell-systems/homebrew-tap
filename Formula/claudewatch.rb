class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.8.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.8.0/claudewatch_0.8.0_darwin_arm64.tar.gz"
      sha256 "647b164b515cf9266c89707f52c8183ca2b717f5a60736b9246198f320bedf27"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.8.0/claudewatch_0.8.0_darwin_amd64.tar.gz"
      sha256 "fa26ed0b30ac338a7358f314e2a424c3dbd949c702b9ed73fb347965c6673ff6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.8.0/claudewatch_0.8.0_linux_arm64.tar.gz"
      sha256 "6374c7299108c6257e7663d9211fc62f9059cffb24aedb2e96d3b39ef1282197"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.8.0/claudewatch_0.8.0_linux_amd64.tar.gz"
      sha256 "20a130610b0f1f07cf284a5b90204a1a568766ed76c14341a829c5ce615a36f1"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
