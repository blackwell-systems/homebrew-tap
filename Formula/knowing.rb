class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.14.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.14.0/knowing_darwin_arm64.tar.gz"
      sha256 "35585f9712c065a568a9fc636bf6f1e2962e51a50044157dfca513d30ae8a923"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.14.0/knowing_darwin_amd64.tar.gz"
      sha256 "a6a7ad412c93046cee75b6f13a52dea7e4c7a9f758487fc95834e1ec414f335b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.14.0/knowing_linux_arm64.tar.gz"
      sha256 "6cd598a0f8bfc1311c8b9578f4689b7daed9cfaf4b217d99bf16ba57261f4547"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.14.0/knowing_linux_amd64.tar.gz"
      sha256 "725756a5074a9589d51b32e49a26cc576886d7ed52abb388c71fc37cf735c87b"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
