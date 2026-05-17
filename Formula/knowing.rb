class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_darwin_arm64.tar.gz"
      sha256 "53f608f80016f41fea9b6e14b0fce45bcbf55ad19b3e3ab2168108e2424beb35"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_darwin_amd64.tar.gz"
      sha256 "4dbb433f4bb1d1eab1b8ea0d8dad0dce05d8d5f4458001679b9c13139f013318"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_linux_arm64.tar.gz"
      sha256 "7e03de6a86cd1187323aeec302c87f45e1978024425a63e4ef3d4db5b9dd77d6"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_linux_amd64.tar.gz"
      sha256 "6ef3a611cae3e774a5528b25dcf44728b3e9d41f2510504bff107bcfa6472d3b"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
