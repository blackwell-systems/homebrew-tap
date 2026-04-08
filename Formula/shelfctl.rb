# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.2/shelfctl_0.4.2_Darwin_x86_64.tar.gz"
      sha256 "2580cbf6f1b9ea52aef0f12138760396c03b2738909cc3565ec56fda831babeb"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.2/shelfctl_0.4.2_Darwin_arm64.tar.gz"
      sha256 "fed813af49d90bc29fb0503747b3b690b2f5089e6e1403ad2500b56279cabd19"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.2/shelfctl_0.4.2_Linux_x86_64.tar.gz"
      sha256 "213927122db636ed18d66ecb2e3c5e0c649225c201427bff150d54df98b07abc"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.2/shelfctl_0.4.2_Linux_arm64.tar.gz"
      sha256 "4657bc00e97ebd53fcaeb39195cf48b34b77fffb6c520ad6197f93b6ebb6824b"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
