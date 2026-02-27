class Brewprune < Formula
  desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
  homepage "https://github.com/blackwell-systems/brewprune"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.0/brewprune_0.1.0_darwin_arm64.tar.gz"
      sha256 "02ae35caadd3841258082b9f3c4ad00a6009f936f0d477b5bea913ba2221f5ad"
    else
      url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.0/brewprune_0.1.0_darwin_amd64.tar.gz"
      sha256 "6818e2e6357ef48046f086b7d6489409592d9a0f91c66f6fe1820d7528040682"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.0/brewprune_0.1.0_linux_arm64.tar.gz"
      sha256 "175c72f278467f570c8712387a01a5f7d41212f4adc1f964b1480c3f23dfcbee"
    else
      url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.0/brewprune_0.1.0_linux_amd64.tar.gz"
      sha256 "8cda38cd81d88f33fe74b19cc4ee51f832519eb627b55159c9b2c831cd72d744"
    end
  end

  def install
    bin.install "brewprune"
  end

  test do
    system "#{bin}/brewprune", "--version"
  end
end
