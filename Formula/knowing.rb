class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.15.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.15.0/knowing_darwin_arm64.tar.gz"
      sha256 "65be27336a10da2b4be31bdd37699e9820feed3bb5eca9ece9916a2e506619ed"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.15.0/knowing_darwin_amd64.tar.gz"
      sha256 "1707683d52551775d2be4870f8b5e5ae9b9c334c83bc3117e56a22f28fc83178"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.15.0/knowing_linux_arm64.tar.gz"
      sha256 "a2da41457d5874bd705d027c2a091f480a097b838bf9c9ee9fc0e995a1a05c17"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.15.0/knowing_linux_amd64.tar.gz"
      sha256 "9130133d24f21a2516d28400143c6c7d206bb5e6e77443e65cd55b8b5c232258"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
