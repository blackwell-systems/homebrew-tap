class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.9.0/knowing_darwin_arm64.tar.gz"
      sha256 "229ec0c90fe924eb0e614f4e8f033021399f40dd97d2e444c194b5a5131cc0fb"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.9.0/knowing_darwin_amd64.tar.gz"
      sha256 "3575d77efebd91db5e0bc60a082bbac2d47216e9b98288fdea3e4954f07bdf5c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.9.0/knowing_linux_arm64.tar.gz"
      sha256 "d6a91ac832e12bfc61635ef7960e394e66230c1fec3e8329031cb78c4119f3f2"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.9.0/knowing_linux_amd64.tar.gz"
      sha256 "2ec02c9b351e2ae1a6978549bf924efbbf3c529bf095d5f86387edf13c87a84b"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
