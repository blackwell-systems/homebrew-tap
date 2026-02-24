# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.2.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.4/shelfctl_0.2.4_Darwin_x86_64.tar.gz"
      sha256 "41d14a37ec2d59dc800d4c8d66687cf0670936d96f63b94c4820fdb32658cfcd"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.4/shelfctl_0.2.4_Darwin_arm64.tar.gz"
      sha256 "610524c27646798132260c8ca9667ae6d64859316da593e0da65726d48e62c84"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.4/shelfctl_0.2.4_Linux_x86_64.tar.gz"
      sha256 "9399050d32d2dcbbfa3c67bd6f9afbab601eba7514e7e092259017c95106c7cc"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.4/shelfctl_0.2.4_Linux_arm64.tar.gz"
      sha256 "2c9b4ef79f7f1b3f96854a3b504fb798dc981899bcaf5209788402a209b3cd3d"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
