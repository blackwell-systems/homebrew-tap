class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.7.0/knowing_darwin_arm64.tar.gz"
      sha256 "2f47638d97aee2276dca349be42d88e3f3911a8f1686fff0d849115247b07c40"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.7.0/knowing_darwin_amd64.tar.gz"
      sha256 "d6ff1913abae7b483010d1af581c8b584859fbb50dd61a7260a1d4d3c6cec667"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.7.0/knowing_linux_arm64.tar.gz"
      sha256 "5df499ecab2769049445890c61cfb769d8321333951842f9cd7b48cf2ebcf4de"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.7.0/knowing_linux_amd64.tar.gz"
      sha256 "7c3eccafac08cd30547491d9ff474e480e3be86bf21ab883024f7e3d509307c4"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
