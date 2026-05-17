class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_darwin_arm64.tar.gz"
      sha256 "6a9fda5400e2df2f20b0730c4a8c4d119a1832c591ff474ae7fb802b509426d9"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_darwin_amd64.tar.gz"
      sha256 "a7df65a12de4c2e6ce20fa656a63f264f1a6088ff0c4efb8ef7c161defb54c83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_linux_arm64.tar.gz"
      sha256 "cbe7bc846bab1c6033c953b36d8f716949e874f1c9d70248127b68afba4eaee8"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_linux_amd64.tar.gz"
      sha256 "cbe2d637317b05991b3b59fcb5633a7b23795ae1fbc2ea18f0b15b205df37e5b"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
