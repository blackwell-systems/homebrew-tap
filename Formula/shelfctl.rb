# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.2.6"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.6/shelfctl_0.2.6_Darwin_x86_64.tar.gz"
      sha256 "188bfa9ea7a78f87277d436c7bb109b9536635ec29068e985f772d068d098b43"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.6/shelfctl_0.2.6_Darwin_arm64.tar.gz"
      sha256 "5da2850079a5bf9de45fc079ed8696366d985705d839cfe9c137048c1a66601c"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.6/shelfctl_0.2.6_Linux_x86_64.tar.gz"
      sha256 "6ddceb115e1698f7f1e89cc4f3d2564ef2131137954d7e190390cff423b49e23"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.6/shelfctl_0.2.6_Linux_arm64.tar.gz"
      sha256 "1bf2204f3ba31e748f16b583843603cdfb64d68c54d99ae1b21e56774a22c0a2"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
