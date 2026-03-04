class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.10.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.10.0/claudewatch_0.10.0_darwin_arm64.tar.gz"
      sha256 "8a23e9435fa7fc5e0677be1db864b8fd4d9f92548c098a13e45a5ab82f04c079"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.10.0/claudewatch_0.10.0_darwin_amd64.tar.gz"
      sha256 "f1b1e8b39c1063dca2467f060d8eefd8d398f4d3f814ba4f0b1a1abe70e9e6ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.10.0/claudewatch_0.10.0_linux_arm64.tar.gz"
      sha256 "0726596ea90c4248f996a854b59d54b89ec23a88bcac06f37bfca938ac3e7174"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.10.0/claudewatch_0.10.0_linux_amd64.tar.gz"
      sha256 "cde53f47213258a3229ce80f0a305d1c9ebea6862ed814a413f31195700247c5"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
