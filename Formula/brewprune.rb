class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.1.3"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.3/brewprune_0.1.3_darwin_arm64.tar.gz"
        sha256 "615dbe8134212e3e32a0a585fe1e3e40c56c99211df5cf224940a0458924d12d"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.3/brewprune_0.1.3_darwin_amd64.tar.gz"
        sha256 "22d674e6fab58f2ccfc0283cc389250ffcfecb8ccafc15a72b6cdc9c09014992"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.3/brewprune_0.1.3_linux_arm64.tar.gz"
        sha256 "ec75b4a6d36468433d2dc45023765db618322cd2cd0f3f7cbc0f4d9cfacc7633"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.3/brewprune_0.1.3_linux_amd64.tar.gz"
        sha256 "aa84b8fb9f88a2e9d4c4c04d8083c35fdd6f588efc17399972c2d25132b6a326"
      end
    end

    def install
      bin.install "brewprune"
    end

    test do
      system "#{bin}/brewprune", "--version"
    end
  end
