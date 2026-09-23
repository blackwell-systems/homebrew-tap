class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "Apache-2.0"
  version "0.16.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.16.0/knowing_darwin_arm64.tar.gz"
      sha256 "ae29ce029e531fd0cd4799c1c228661ca1fedee03503d77cfdf0ad9c41a327b8"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.16.0/knowing_darwin_amd64.tar.gz"
      sha256 "729769a3fd1de06aec857d34b491c12ac4214d3a1001c48292ac555a0378d50a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.16.0/knowing_linux_arm64.tar.gz"
      sha256 "1b49e7154afe4a3c612a8678510939ae05a5c006951687c707cc60166b3ddfb0"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.16.0/knowing_linux_amd64.tar.gz"
      sha256 "209fb141e3592d5bf7251ff1c28bf0f1194a142fcda4c8b1901c6cbaf9461cbc"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
