class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.8.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.8.1/knowing_darwin_arm64.tar.gz"
      sha256 "08a531c384248ad08b60ed6477c18f7f31f5b7b9c13c483d03fc0e76a6f330c5"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.8.1/knowing_darwin_amd64.tar.gz"
      sha256 "224f4cae00e62291b228e432cf20c4f3c7b6beb5b71c0b2fd341bd54725fc285"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.8.1/knowing_linux_arm64.tar.gz"
      sha256 "00db1bfdeaf96651e2cb7fe73736eff053af1fecc6056065cd20165105ad302b"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.8.1/knowing_linux_amd64.tar.gz"
      sha256 "1a1d6e6252ca22d52652552afdee8bdc67e62b4329483681941846f0214e027c"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
