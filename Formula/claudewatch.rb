class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.7.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.0/claudewatch_0.7.0_darwin_arm64.tar.gz"
      sha256 "a1921bc95918fbf70258c29aaa60743308e6ab7383a5d52bdb97be89b2d4afc3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.0/claudewatch_0.7.0_darwin_amd64.tar.gz"
      sha256 "cda3c750bddf7468cdc680d1009c5769a343d51559797541c07277de1914dbb6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.0/claudewatch_0.7.0_linux_arm64.tar.gz"
      sha256 "b72c838e48b9c63fd5ba58dada62995593bb7f52d3719584606a6e9ef00f3c0c"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.0/claudewatch_0.7.0_linux_amd64.tar.gz"
      sha256 "c904b536d357601cf557e32540b47f20cf3cc87fd93222ecebfd6aff74b98f01"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
