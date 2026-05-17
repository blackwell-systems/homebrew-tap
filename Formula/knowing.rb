class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_darwin_arm64.tar.gz"
      sha256 "aebd0413e463f5b8b44cf896f7259d3b1681a9d7f610cab828104a9abf4723b8"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_darwin_amd64.tar.gz"
      sha256 "8b1597430a0c8a8b547c85b3b5589371535acde9fc1db7e2355a76aabb68dfe0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_linux_arm64.tar.gz"
      sha256 "a052e9d6f0675f48abbd97616ec741c46df00b900ad15c5ad065dd92a88e1b92"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_linux_amd64.tar.gz"
      sha256 "49648ba1d93e0f5da801f849ea649196f2dfe161b3fda013f9921d8afc46ee9f"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
