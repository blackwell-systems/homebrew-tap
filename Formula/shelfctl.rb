# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.3.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.3/shelfctl_0.3.3_Darwin_x86_64.tar.gz"
      sha256 "243afa76c3b16df891d53561a8a516c83f36474598639745a7552bed95bdbc93"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.3/shelfctl_0.3.3_Darwin_arm64.tar.gz"
      sha256 "04788aa65776dada50329417f3bd958c1503ca228551ccf8183977e2ba4c8606"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.3/shelfctl_0.3.3_Linux_x86_64.tar.gz"
      sha256 "e5a6e956ec29b9f6f6797e743f0f55efd2896577eae6141a9bb451830e379e0d"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.3/shelfctl_0.3.3_Linux_arm64.tar.gz"
      sha256 "aeecc6c13216d550eb828419d7325cdbf1efe45d1755d6f7735a1809cccae4f4"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
