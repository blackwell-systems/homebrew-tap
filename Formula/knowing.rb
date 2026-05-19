class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.3.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.3.0/knowing_darwin_arm64.tar.gz"
      sha256 "46f016f811f7b5d4978ed140ddebb14873bf7517a73dbac4384748e64d93101b"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.3.0/knowing_darwin_amd64.tar.gz"
      sha256 "6f9d684a8b4f7059173609242031a59d85f4c9c1f82faadb6c476b0d6b58e452"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.3.0/knowing_linux_arm64.tar.gz"
      sha256 "10ef1efd112ee4b152511d803dadf7bebec1e984c1c7baf9e2c10077cb89c209"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.3.0/knowing_linux_amd64.tar.gz"
      sha256 "46024591d73c7eed66cf48cc644d011c26a28c70ec08a725ac3fad3d6c1a2402"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
