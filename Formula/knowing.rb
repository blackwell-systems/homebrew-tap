class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.10.0/knowing_darwin_arm64.tar.gz"
      sha256 "5e7e66cd5f175ba833360b691679b6908a6e112266e327b8a03b26b3f5ebb104"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.10.0/knowing_darwin_amd64.tar.gz"
      sha256 "2ebaca700cb1da749fdbeadc7291d376c941ba5b7d7b4893c07bbcba55975bce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.10.0/knowing_linux_arm64.tar.gz"
      sha256 "f2e0e244fa25eaf7242b80a3596949c8f22f904b448f180f93e75d1cf67864ca"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.10.0/knowing_linux_amd64.tar.gz"
      sha256 "883b91f0226936dfc9977f3d9c49a5b8805e6651cfb4b16e5daade0b524380ce"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
