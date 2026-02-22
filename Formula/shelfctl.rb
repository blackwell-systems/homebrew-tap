# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.1.2/shelfctl_0.1.2_Darwin_x86_64.tar.gz"
      sha256 "fd991fca951fd7ceb116658be466903a6cd737d1781b5759ba67014cfbd4c19f"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.1.2/shelfctl_0.1.2_Darwin_arm64.tar.gz"
      sha256 "2aa07ece952480b3c4c660a96cf50022f661b31b89ac8c82c2ce8699fbd14c29"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.1.2/shelfctl_0.1.2_Linux_x86_64.tar.gz"
      sha256 "e038aaadd499ec69b0b5b0e4ca68a32a0bbe8171f060cff95a16c3aa30988aeb"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.1.2/shelfctl_0.1.2_Linux_arm64.tar.gz"
      sha256 "a3fffea02d0b4baab58a953b2a427adfd77e06a4cae28cbceb129bb18b6692f5"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
