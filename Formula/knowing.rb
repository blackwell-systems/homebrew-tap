class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.6.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.1/knowing_darwin_arm64.tar.gz"
      sha256 "08c2675e9881801c5e3a42391c0dce332fd65729e1c2f8f354105abefb80447a"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.1/knowing_darwin_amd64.tar.gz"
      sha256 "b2d47e5535ecc44e4252b2c4b4169aceaebcf644d60b8fa4fdbe93cd4aef818e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.1/knowing_linux_arm64.tar.gz"
      sha256 "ddc4baf98c36bd4b3b99ab3b535da24926a80a0c1ca48c8424d5d591978801e4"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.1/knowing_linux_amd64.tar.gz"
      sha256 "db14425764fcde7f137494e21140c8381b917518f7791ed7443b19d61a314177"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
