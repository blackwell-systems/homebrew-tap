class Brewprune < Formula
  desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
  homepage "https://github.com/blackwell-systems/brewprune"
  version "0.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.1/brewprune_0.1.1_darwin_arm64.tar.gz"
      sha256 "9f57f0b5f92243f1aaa97637a8d56e80309eef78d5354ea9c0e5c27c4b02aa5b"
    else
      url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.1/brewprune_0.1.1_darwin_amd64.tar.gz"
      sha256 "5c5a7e56d5ad917026de2f8291084c3dc9230224088124875e50084c6df0b0ed"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.1/brewprune_0.1.1_linux_arm64.tar.gz"
      sha256 "b670c33766ef30c02f70b6f0881001758cfcfabe78c502aaac0d139c3d46244b"
    else
      url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.1/brewprune_0.1.1_linux_amd64.tar.gz"
      sha256 "cec5374e6e13eda88334fb5ff9708c2af69f4015a6110aa95458f3224b40b552"
    end
  end

  def install
    bin.install "brewprune"
  end

  test do
    system "#{bin}/brewprune", "--version"
  end
end
