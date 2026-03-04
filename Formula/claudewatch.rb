class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.9.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.9.0/claudewatch_0.9.0_darwin_arm64.tar.gz"
      sha256 "02b5a409980cb937e92639903296242d70e99488336e41ff0fe0c517c9d282bc"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.9.0/claudewatch_0.9.0_darwin_amd64.tar.gz"
      sha256 "b159acc089ae90a0eda2dade069e6d9dc51ddecf70ef17442009e201fde9f3d6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.9.0/claudewatch_0.9.0_linux_arm64.tar.gz"
      sha256 "7be558110cd9832f81613029974783e7e4fae623505025ac7b317ea1c7815623"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.9.0/claudewatch_0.9.0_linux_amd64.tar.gz"
      sha256 "d9a1e231dcd6ce67d6a8f371078a06fba012ebaf12403c631d5032419f7e45b9"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
