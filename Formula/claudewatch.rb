class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.6.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.6.0/claudewatch_0.6.0_darwin_arm64.tar.gz"
      sha256 "159e6dee4a4f0dbaae285e29a512ce8562fca36026baf2f488c500cdb6dec3db"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.6.0/claudewatch_0.6.0_darwin_amd64.tar.gz"
      sha256 "d2b5c66eadb965358fafcc19b3134386fa0d2ecea521e273bc87f75d96b48ad8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.6.0/claudewatch_0.6.0_linux_arm64.tar.gz"
      sha256 "57c3ad5284a530b183ec3c71767bac129b234ac5c739a2c5f74fa74652286499"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.6.0/claudewatch_0.6.0_linux_amd64.tar.gz"
      sha256 "ab526db290cf2b9b2788f5ff5e3416743ee7b9574065c7d5219e8d6425e55d3e"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
