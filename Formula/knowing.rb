class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.10.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.10.1/knowing_darwin_arm64.tar.gz"
      sha256 "016ea292a3bec779c9f94d9c95eaa5bb76af253994efe756e0c608a33521d4af"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.10.1/knowing_darwin_amd64.tar.gz"
      sha256 "af7b8f48b55a7490a7f7301a580b2cc09b76f2ce43f3eae581b793add00aa143"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.10.1/knowing_linux_arm64.tar.gz"
      sha256 "ececbff5495697aa6490e46ee7293168b2a0846f82306175e97dfd4fd996a693"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.10.1/knowing_linux_amd64.tar.gz"
      sha256 "962a89c7995d4ac7ab7474427e5146a0a436ece663a3f3bf3196a974f975f408"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
