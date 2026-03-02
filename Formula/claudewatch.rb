class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.7.3"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.3/claudewatch_0.7.3_darwin_arm64.tar.gz"
      sha256 "44c67cabd3a9dbf1ac87c03f95a4ce71b3165357734ee87076f4adec9e6131fa"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.3/claudewatch_0.7.3_darwin_amd64.tar.gz"
      sha256 "0ca2e7bef83fd789a0e10d310140593945fc1fd1e939d17602440e5b5f136659"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.3/claudewatch_0.7.3_linux_arm64.tar.gz"
      sha256 "af406334d288aa5f810440fd1cf2c878cc42f9495b3f04c3c2aeccb771573633"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.3/claudewatch_0.7.3_linux_amd64.tar.gz"
      sha256 "f8d176895bb47de8cd1895e25b42efac5d7d2eedede7bef73d80fd0c7bde8c46"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
