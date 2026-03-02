class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.7.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.6/claudewatch_0.7.6_darwin_arm64.tar.gz"
      sha256 "9b9c638a6e36238f798305a942c352f8cdce626ed9daf6655d5f8a01bf422a6b"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.6/claudewatch_0.7.6_darwin_amd64.tar.gz"
      sha256 "703dcb398ea6f83895cf89275f0e29d907cac4379b5846672e99327e8dfef915"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.6/claudewatch_0.7.6_linux_arm64.tar.gz"
      sha256 "8816a891b41a88da9d7593253480194ecd7fafab2434d7bd667ce5df5ed1e588"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.6/claudewatch_0.7.6_linux_amd64.tar.gz"
      sha256 "7a7476bdc409fc0a755df55d708630882e1146c29f9fe5467b508c5180b40cbe"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
