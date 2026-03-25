class Sawtools < Formula
  desc "CLI tools for the Scout-and-Wave parallel agent coordination protocol"
  homepage "https://github.com/blackwell-systems/scout-and-wave"
  version "0.92.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/scout-and-wave-go/releases/download/v0.92.0/sawtools_0.92.0_darwin_arm64.tar.gz"
      sha256 "79478c313d5d6908d219e8aae30cf74439d0e7d774fb12d548f7e73e0df7b4fb"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/scout-and-wave-go/releases/download/v0.92.0/sawtools_0.92.0_darwin_amd64.tar.gz"
      sha256 "718b3155f8d7efb41dc3800ded740532d3e7bbd6c2f8b5f9806a6d2455128fc5"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/scout-and-wave-go/releases/download/v0.92.0/sawtools_0.92.0_linux_arm64.tar.gz"
      sha256 "430cf5af63a3cf03c83a1a16732e051ec7b6ee3ff07cf48d7e9dda42edcfbed4"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/scout-and-wave-go/releases/download/v0.92.0/sawtools_0.92.0_linux_amd64.tar.gz"
      sha256 "9cdc56c6e9f20f267b43cc4a24f44b1dd24397fcf42b8094d269028a31e01ad1"
    end
  end

  def install
    bin.install "sawtools"
  end

  def caveats
    <<~EOS
      Get started with Scout-and-Wave:

      1. Clone the protocol repo and install the skill:
         git clone https://github.com/blackwell-systems/scout-and-wave.git
         cd scout-and-wave && ./install.sh

      2. In Claude Code, run:
         /saw scout "describe your feature"

      Documentation: https://github.com/blackwell-systems/scout-and-wave
    EOS
  end

  test do
    system "#{bin}/sawtools", "version"
  end
end
