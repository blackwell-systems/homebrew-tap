class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.2.0/knowing_darwin_arm64.tar.gz"
      sha256 "c39363bf231f0c7f31211ca68ae260c29b7bb8ee1df6ba34303ed5798b12c2f5"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.2.0/knowing_darwin_amd64.tar.gz"
      sha256 "34b5f86b581ccc7500567c1bb3cc4f0693c99268dc7d33e609458997971e22f5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.2.0/knowing_linux_arm64.tar.gz"
      sha256 "68eb5a694ab71b80049983cedd75eec772da70ea1b2bdbf0eb8d4044bc9e59d3"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.2.0/knowing_linux_amd64.tar.gz"
      sha256 "e61b8c2643e09e95a8cfbf30cfc9dbbe01a97e4b22968723631e5efebbb78053"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
