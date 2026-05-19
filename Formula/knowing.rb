class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.4.0/knowing_darwin_arm64.tar.gz"
      sha256 "144e11f0a12ed47926f2137549d3537c89bfb5cca1ea311294a6ffc908650428"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.4.0/knowing_darwin_amd64.tar.gz"
      sha256 "3b0f2693614f7146bbb2c30c549ff9f5fb97ca1f18990df9b55e66602ecae2c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.4.0/knowing_linux_arm64.tar.gz"
      sha256 "1855034e9645ff32a005f4aaa342f71c57dcebf836a695d7aca0841c4095394d"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.4.0/knowing_linux_amd64.tar.gz"
      sha256 "00a20e667f162d150f6c21538b23f89e07827bb5729f556757172174add3ffb7"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
