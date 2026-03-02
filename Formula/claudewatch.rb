class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.7.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.4/claudewatch_0.7.4_darwin_arm64.tar.gz"
      sha256 "f43b777325d3cbbb66006c7dcdf7dfb910db73863f284b96715ca00ea414a86f"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.4/claudewatch_0.7.4_darwin_amd64.tar.gz"
      sha256 "c9697ee4087ab6f7d1c0a96eb53630ba3c4d56f7ad470f0f5d6bb221928dba98"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.4/claudewatch_0.7.4_linux_arm64.tar.gz"
      sha256 "b39ac85e8f813127fa3d98d50d86341b3ffb64f6a1b4c2e88ab00d7aeac83de5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.4/claudewatch_0.7.4_linux_amd64.tar.gz"
      sha256 "4a9293a456043caecda9d871af6b14e300899c4c05d7348b256813c8a8098227"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
