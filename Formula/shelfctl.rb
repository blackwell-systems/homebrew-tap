# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.1/shelfctl_0.2.1_Darwin_x86_64.tar.gz"
      sha256 "87780c73c87a193d0929597c56a2ed6afa48cc766a01db501aebd52d5b44a3dd"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.1/shelfctl_0.2.1_Darwin_arm64.tar.gz"
      sha256 "fa45ba90e713f3d7f6caa0fcb71d96828f7be429f6bb658ba5897cb56f7a6a69"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.1/shelfctl_0.2.1_Linux_x86_64.tar.gz"
      sha256 "8c121cc5c433693c256d0e0263f6d0c6dbe4e87c122abc20a58f55b3568185fd"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.1/shelfctl_0.2.1_Linux_arm64.tar.gz"
      sha256 "8ddc4b3c1ed9c77e90a9dba9eaa1f8ed233aa62867339e71f96a161681f66cfe"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
