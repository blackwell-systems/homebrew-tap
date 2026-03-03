class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.7.9"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.9/claudewatch_0.7.9_darwin_arm64.tar.gz"
      sha256 "ea5becc2576129ae7ccddd9526ba31481d58ea48cd7f64c7f77cfe9b55b2acf7"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.9/claudewatch_0.7.9_darwin_amd64.tar.gz"
      sha256 "ace7b44b96f8f59f716bd9b926b1a4dafe54780c3e93f7f72debb5f87029fb3a"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.9/claudewatch_0.7.9_linux_arm64.tar.gz"
      sha256 "a7e003582023c245f2bc9ede6f94ab85491a094d78b8190ff5dabbfe4faced23"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.9/claudewatch_0.7.9_linux_amd64.tar.gz"
      sha256 "35c730d00d3bef8df8a1374331817fcddfa16f252b96d83af4e2b66261c39a3e"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
