class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.8.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.8.0/knowing_darwin_arm64.tar.gz"
      sha256 "00856abc352b2f1a90f4d95bf25b5b8a7141f7dc6f7292bc8ef39c59783a99ed"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.8.0/knowing_darwin_amd64.tar.gz"
      sha256 "e3df6e3c33c846a09b677a8a9c64a76bb0d59a7d9703ac413e39af600c6633e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.8.0/knowing_linux_arm64.tar.gz"
      sha256 "98851881cc7dd908f415baa74d3f798e5126e867eef9441652504e0421bfb338"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.8.0/knowing_linux_amd64.tar.gz"
      sha256 "ffe71341e25a4e09a42abc92af6f324edafdf3ad8e5689a1b781a58e3809982c"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
