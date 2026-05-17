class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_darwin_arm64.tar.gz"
      sha256 "b792c9c646613ad4b9a11bb722fa786274b7915cb448dd6ab5d6e37523dcb4ed"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_darwin_amd64.tar.gz"
      sha256 "fdfb362c1ddb3f8a2ba41335eaa145b2a0106e4f8a1b8bd7285489340fc44ae8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_linux_arm64.tar.gz"
      sha256 "455ced24b5442cd85158c2b732861293728963d9673c9ba9d53d55608b73d9e1"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_linux_amd64.tar.gz"
      sha256 "dd7176cff1e7f5019fee694755869c7f19d2edcfd2716cd9aff20268002c34a8"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
