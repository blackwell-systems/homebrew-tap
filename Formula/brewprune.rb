class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.1.4"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.4/brewprune_0.1.4_darwin_arm64.tar.gz"
        sha256 "f52b4b78b04ab79e8146279f9289708b81e876180ac7873d8d53ed51cfa88bb4"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.4/brewprune_0.1.4_darwin_amd64.tar.gz"
        sha256 "9fd319483dd53b193aa11f88bd80e2a59ace4a302fc2748dcec9d2ed8c06149d"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.4/brewprune_0.1.4_linux_arm64.tar.gz"
        sha256 "ccbea515fe260372a1d90b57c3e922ffe26952a0f229d71fec62e5b010b03c6c"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.4/brewprune_0.1.4_linux_amd64.tar.gz"
        sha256 "34f14c06394cf0298d4266254b357a8076991c9cd3330ba322eecd2f544f1d55"
      end
    end

    def install
      bin.install "brewprune"
      bin.install "brewprune-shim"
    end

    test do
      system "#{bin}/brewprune", "--version"
    end
  end
