class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.7.7"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.7/claudewatch_0.7.7_darwin_arm64.tar.gz"
      sha256 "a0eb6659f946eb7081935a80415dbb3212752edf235058c0e5f298aced4b3846"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.7/claudewatch_0.7.7_darwin_amd64.tar.gz"
      sha256 "64909aa7ef911a0ad685f38691cabcee3e9766dc5a36742241189c3ed496d6d2"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.7/claudewatch_0.7.7_linux_arm64.tar.gz"
      sha256 "62ae0899a69d17910fe652f23f6bb955dd80471b38df9535000d765922e53e2d"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.7/claudewatch_0.7.7_linux_amd64.tar.gz"
      sha256 "001a587eddaa5e9fa131831c342c2db1230a573049adb4927d12cf4546ca7101"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
