class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.5.0/knowing_darwin_arm64.tar.gz"
      sha256 "2e12e6c65235f75dcdbe5f44e7a9c8e9d13d5c6e9dac68d73e3e2926cb87c89b"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.5.0/knowing_darwin_amd64.tar.gz"
      sha256 "c25e55d7abe6a18468cefccca95a85d005a891e47bf8fa088e9894845965c9b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.5.0/knowing_linux_arm64.tar.gz"
      sha256 "4568c03695180fc223a9814c5cd730d3940045e0227dac0c0f7b4403e01960e4"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.5.0/knowing_linux_amd64.tar.gz"
      sha256 "b3d0e0e2b67c3d84aa0643f0e995f8b7202e549ca41672ccc12cf92cdf93b062"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
