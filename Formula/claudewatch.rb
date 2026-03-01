class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.4.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.4.2/claudewatch_0.4.2_darwin_arm64.tar.gz"
      sha256 "8be9a8a67cea69ac7ad3c216cc482c4d59af62f840c0834a0948bfb864aa0541"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.4.2/claudewatch_0.4.2_darwin_amd64.tar.gz"
      sha256 "35558b9c3ac9848408ee9be93fd5be5319acf68ac8046b70f553d8b3bf572f5b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.4.2/claudewatch_0.4.2_linux_arm64.tar.gz"
      sha256 "1152e55cef76d3dc3cc75a3e0e35f097fb6b479c767b9ed84c0547e45738b148"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.4.2/claudewatch_0.4.2_linux_amd64.tar.gz"
      sha256 "ed2da2585af7f3118b7be270fa6fdb23a88a84a558c3896f8803b93361e7acd5"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
