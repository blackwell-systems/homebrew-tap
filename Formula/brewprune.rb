class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.1.2"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.2/brewprune_0.1.2_darwin_arm64.tar.gz"
        sha256 "499158e375fea1543ca1367c62188433230dc6194537308895443fe90967011c"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.2/brewprune_0.1.2_darwin_amd64.tar.gz"
        sha256 "a46b5137b4635286f3370117a157dc17521ed2bcb19768e3ae0b47c9376f7091"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.2/brewprune_0.1.2_linux_arm64.tar.gz"
        sha256 "6d1afcbeb3c5716cc624ea48d6277ca7fd315d07262bc3cf51467f820b131651"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.2/brewprune_0.1.2_linux_amd64.tar.gz"
        sha256 "3d1d8a8bbc3458fecbf12c15a94cfe2208fe9b6c8cbf6fbbca1d4552759014c0"
      end
    end

    def install
      bin.install "brewprune"
    end

    test do
      system "#{bin}/brewprune", "--version"
    end
  end
