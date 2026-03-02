class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.7.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.1/claudewatch_0.7.1_darwin_arm64.tar.gz"
      sha256 "ae1e8c8cd81578685c293eb25c5fb96110e0ebb213c22226bfa2db798f721f42"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.1/claudewatch_0.7.1_darwin_amd64.tar.gz"
      sha256 "d1b6c2087d02e1438d9d3b6ff3a26475590d98a6a2831d34e02d77f8b65f02b6"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.1/claudewatch_0.7.1_linux_arm64.tar.gz"
      sha256 "d153d19fbaaaf05d90e194618a2fd502b144a0dee5b220102b882cd1d38643d9"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.1/claudewatch_0.7.1_linux_amd64.tar.gz"
      sha256 "180e87aa7db19934c133b7a5aa8e27823e77af423f6188da81a30aaa20c8e6ee"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
