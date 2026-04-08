# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.4.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.3/shelfctl_0.4.3_Darwin_x86_64.tar.gz"
      sha256 "ed27216224b93eccb4877e474f8d007e4ab7b3b405fe79bd6e306d9ade908f84"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.3/shelfctl_0.4.3_Darwin_arm64.tar.gz"
      sha256 "0af1cdae9f745c5cd9d366b182032cf9a6f3c30701a969264a476b31b7c578ef"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.3/shelfctl_0.4.3_Linux_x86_64.tar.gz"
      sha256 "a5deef94051728d27cb8b2f8959aaa01347c6cbec51e5997f0b75cbf34cc4061"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.4.3/shelfctl_0.4.3_Linux_arm64.tar.gz"
      sha256 "dcbc8ea8c389516cbff8d624b35e76f618840171ff8e803059d56cd645f76df1"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
