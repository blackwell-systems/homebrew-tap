# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.3.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.0/shelfctl_0.3.0_Darwin_x86_64.tar.gz"
      sha256 "d67d0f4243c1acd0986d65ea80742049b0916676c87520bf0266d10e5df4d80b"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.0/shelfctl_0.3.0_Darwin_arm64.tar.gz"
      sha256 "6d9110a03438b70663a4b5c50bd7bda95ea68abca721c5db84f53cab7f540b5a"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.0/shelfctl_0.3.0_Linux_x86_64.tar.gz"
      sha256 "b6450779e71ebd2d874bce1d0a703da4c270cb259e41d59583f840313a8bbe5a"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.0/shelfctl_0.3.0_Linux_arm64.tar.gz"
      sha256 "7c183eab90abd9d07b952b5eb5c8c9f0ef31801825e1b3d852236c3c4709eaca"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
