class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.7.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.2/claudewatch_0.7.2_darwin_arm64.tar.gz"
      sha256 "a2b002dd13ee31dd15434d99c3c4eedd68ea388f8abcae961b5e905846a61519"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.2/claudewatch_0.7.2_darwin_amd64.tar.gz"
      sha256 "ebc46141a3802d85048a79eee9e2d8b2c949c4da797b91aa060fc2f36485976f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.2/claudewatch_0.7.2_linux_arm64.tar.gz"
      sha256 "22e3b8bb1051c4368d1c828b7138732ff34b28a1250abb9642686bc1c5a75624"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.2/claudewatch_0.7.2_linux_amd64.tar.gz"
      sha256 "389849fdb78498cee9bda6e7122c76c9c824d0587ab72a8fcb22f848196112b4"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
