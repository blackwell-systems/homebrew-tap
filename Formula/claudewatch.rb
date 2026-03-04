class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.8.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.8.1/claudewatch_0.8.1_darwin_arm64.tar.gz"
      sha256 "f073ac30a213b731ff6794d8e296d3798dd3a667f1936b22b0ccf00a790a1c6d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.8.1/claudewatch_0.8.1_darwin_amd64.tar.gz"
      sha256 "942b129150790c96f4f731b9a93c3bc9d20b7bcc66c13473e1776bd2e7f19ff4"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.8.1/claudewatch_0.8.1_linux_arm64.tar.gz"
      sha256 "74777c8c9b8eb660b6f4a903248f87e472ef1689e6351e57c6e02e0fd994f5d2"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.8.1/claudewatch_0.8.1_linux_amd64.tar.gz"
      sha256 "52e2967d03721e5ddda267f8f3063ce51af617d09a4505610582cc9a419dce39"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
