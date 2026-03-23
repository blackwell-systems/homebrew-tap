# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.4.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.0/shelfctl_0.4.0_Darwin_x86_64.tar.gz"
      sha256 "1a09ac06e40d379978af1a7c0da7be790fe0c0b000967f97c691ad02a643790f"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.0/shelfctl_0.4.0_Darwin_arm64.tar.gz"
      sha256 "83a9f202318e647b8aa2ea0553cfbf0ab029f41dfbd298ecce3e92ba64359146"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.0/shelfctl_0.4.0_Linux_x86_64.tar.gz"
      sha256 "3a710eecc9691fcd70b74f4d919cd3a27c1db531c2d44b673fb846de24ee41a7"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.0/shelfctl_0.4.0_Linux_arm64.tar.gz"
      sha256 "b79a26787eff1609814c9459294d34c9a5bcb63abf8cc1fc1dc6fe6bdc188626"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
