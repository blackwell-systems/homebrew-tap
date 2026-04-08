# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.4.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.1/shelfctl_0.4.1_Darwin_x86_64.tar.gz"
      sha256 "486a49665e68466687482fcf02311e71e2c3c594811fcf3a0a70f088bc9b4db3"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.1/shelfctl_0.4.1_Darwin_arm64.tar.gz"
      sha256 "7336c62986d441433be6a4add30ad2b963ba6ddf25ebb3619b4aed193d0e3c54"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.1/shelfctl_0.4.1_Linux_x86_64.tar.gz"
      sha256 "a4c5927ac100bbd64a695afeadc6359f2fc91e12c76ef37759b2c747541157bd"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.1/shelfctl_0.4.1_Linux_arm64.tar.gz"
      sha256 "bc49488e0dc3ab418be40303409c90b9d4f848bed5b8f350a46c9461b71ae059"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
