class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.1.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.1/knowing_darwin_arm64.tar.gz"
      sha256 "a278a9376a4c6c0426848a68d09240bb2d7abd0afd80cf7c03b60f7423feb45e"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.1/knowing_darwin_amd64.tar.gz"
      sha256 "4b6434dd74a453995ea9f0f8143e159494b07be9381d08cb9d3c3099f3d724c6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.1/knowing_linux_arm64.tar.gz"
      sha256 "b63c1d3a456c83f51a2b9c1d23be7dc582a3f2dd1cb98c1051b1e4b2e305de73"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.1/knowing_linux_amd64.tar.gz"
      sha256 "f8b4b49d3997e42294eb7f819a70e3736e71d02f905aa5797c07f2f9fac19197"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
