class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.1.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.2/knowing_darwin_arm64.tar.gz"
      sha256 "e1c265661b7bc50dc8acdcffa052282f50e6a1d84219879e8109471b793fcdec"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.2/knowing_darwin_amd64.tar.gz"
      sha256 "fcc112d4049077da9f48a863adc4ba66507621c180d1648a77d49a901c82b3ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.2/knowing_linux_arm64.tar.gz"
      sha256 "79e3007901d5c2160ee7c1d51aeda34bdedf31c6e4a13e9f05bbceaaed24c690"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.2/knowing_linux_amd64.tar.gz"
      sha256 "db4f56e901adfd064bf3c4cbce9495a737b5e76250666def4bd2db26569bb439"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
