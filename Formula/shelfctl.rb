# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.3.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.2/shelfctl_0.3.2_Darwin_x86_64.tar.gz"
      sha256 "550bedf54f2350a99246266afa4edf58b4dfa7d478c9afbec478749b1d6884ba"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.2/shelfctl_0.3.2_Darwin_arm64.tar.gz"
      sha256 "b297c183321e6e882087bda5ef755d19eb108819c9931fcaeb608e11154f601d"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.2/shelfctl_0.3.2_Linux_x86_64.tar.gz"
      sha256 "4e1fa12375bddefe3da350239fe931173b9dc2408ed7a96e41d96d89f08f5948"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.2/shelfctl_0.3.2_Linux_arm64.tar.gz"
      sha256 "7b2033974148ff443af4fd19e52cf26dc18615fd0bf5ead18ef4a3bd5496f8bd"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
