class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.4.2/knowing_darwin_arm64.tar.gz"
      sha256 "5de31abe0a6afefafb504316523afc80a479512cb7f27e5911a37cb937d04150"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.4.2/knowing_darwin_amd64.tar.gz"
      sha256 "991f23f5ef8550c083c01c5c6827c4fe3694046caa1416f1345c11f536c64008"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.4.2/knowing_linux_arm64.tar.gz"
      sha256 "c64b8dfab898ad06a0e61c09e021327cd09c713947cb5a28883d625eef56a443"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.4.2/knowing_linux_amd64.tar.gz"
      sha256 "5754ed88bdb26691b252f4ddc69b2da11734e559687fbc688ba744827e9d276e"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
