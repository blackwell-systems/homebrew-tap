class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.4.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.4.1/knowing_darwin_arm64.tar.gz"
      sha256 "2a01cb48ecf7c89e4478beea1b51e9e4cebc9fa745aa653bbefb2498796f8e00"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.4.1/knowing_darwin_amd64.tar.gz"
      sha256 "dfc4c344e5835d41adc64a59588102879f7de8cf47217e526cfd2bb899161187"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.4.1/knowing_linux_arm64.tar.gz"
      sha256 "8e105079f3d4d609cecfb9a4affe50030e6f27b4995c3cf332aa5bd8f57041c7"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.4.1/knowing_linux_amd64.tar.gz"
      sha256 "da99399e67d77a28b11d7aec30db55d4c34ad426ff2327b90902e7f7c4f1d85a"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
