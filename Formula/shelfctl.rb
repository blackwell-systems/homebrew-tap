# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.2.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.2/shelfctl_0.2.2_Darwin_x86_64.tar.gz"
      sha256 "6351e49315fabb8b0d34cbcc3e6a984a155b40a68306aa8a35c2c236508b8260"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.2/shelfctl_0.2.2_Darwin_arm64.tar.gz"
      sha256 "8c04928b603f1961bef51dc1b0cf3fec9a8db0b4093205454dc58a2adb553de6"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.2/shelfctl_0.2.2_Linux_x86_64.tar.gz"
      sha256 "3257a7dcab5be947640316988981087340d7064b3c85de8cf10a1eabc0f81748"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.2/shelfctl_0.2.2_Linux_arm64.tar.gz"
      sha256 "49dcc40e47f96787f253a41d25eeb9d957dccc2e2e60af15ce762c7dbcda30fd"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
