# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.4.4"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.4/shelfctl_0.4.4_Darwin_x86_64.tar.gz"
      sha256 "c89afb49b97b576e336e736f8b28c40ce2b214f14c705b19f2febd5f96ce6f53"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.4/shelfctl_0.4.4_Darwin_arm64.tar.gz"
      sha256 "7893e25e787e35d6dc728d67589d6474d48db5a7d63d4ffba37b47ae33f262e3"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.4/shelfctl_0.4.4_Linux_x86_64.tar.gz"
      sha256 "6d5b70cd61d469feb185c45571d7add4f0f2c9aae9e526a1c0371a49c5f904f7"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.4/shelfctl_0.4.4_Linux_arm64.tar.gz"
      sha256 "096ceeafd4d8093d965be3ace5108671c65abe725c9f410d618ff78132cd5c00"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
