# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.2.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.3/shelfctl_0.2.3_Darwin_x86_64.tar.gz"
      sha256 "c15bf2a95e83b7df55bfe6ab988057fbbd4cc7f06a5a858607ddf3743eda8106"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.3/shelfctl_0.2.3_Darwin_arm64.tar.gz"
      sha256 "c5baea76e88b3bd1657cf856d03dd516157901729be96f2a22a91c736a768e0a"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.3/shelfctl_0.2.3_Linux_x86_64.tar.gz"
      sha256 "b983d02865747f2c723c72e0990f1c108779e92701e4b5ff87e35a319f484286"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.2.3/shelfctl_0.2.3_Linux_arm64.tar.gz"
      sha256 "d255133379c18c81bc2eb9ee9073c95fb6c290b3e99b6d09d71ae3106c1d7e96"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
