class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "Apache-2.0"
  version "0.16.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.16.0/knowing_darwin_arm64.tar.gz"
      sha256 "36dabb22e3209be61291cf140697fc21588fa6517e3a87567476ba3a330b8115"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.16.0/knowing_darwin_amd64.tar.gz"
      sha256 "03c58a6a81d8e7cfe4407dcd5b82b780b400b130ae43eddda360ed839204f3b3"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.16.0/knowing_linux_arm64.tar.gz"
      sha256 "42a13f29052a9ae03a1d86126e14086d3c01fee6a12d41bc16d7c0ac0883108b"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.16.0/knowing_linux_amd64.tar.gz"
      sha256 "06bcaef37fccb0c8a0b577c915b5f6df79aeeafececc17377beeab766c7e46d7"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
