class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.15.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.15.1/knowing_darwin_arm64.tar.gz"
      sha256 "2def34adc2b8c8678482bc15f6d9c839df9ada4a14409cb7e0f65a07d32149cf"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.15.1/knowing_darwin_amd64.tar.gz"
      sha256 "c3e91b059308a878666069ebc54e9255cb14561275a362b86dc76e204992e683"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.15.1/knowing_linux_arm64.tar.gz"
      sha256 "e6cae860a094564cf32b6aebcb5479710e25eeb6f6281ede1685ec715da0a601"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.15.1/knowing_linux_amd64.tar.gz"
      sha256 "d6040c7a2bead1cb6815b3aa1a772bee5603288bec6b22d322a6a8101a9c10e8"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
