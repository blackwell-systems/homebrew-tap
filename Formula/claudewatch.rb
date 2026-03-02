class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.6.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.6.1/claudewatch_0.6.1_darwin_arm64.tar.gz"
      sha256 "a69173fac6b6885753954d331c13c943b897b8c17a44b16f710d0c83fb815be5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.6.1/claudewatch_0.6.1_darwin_amd64.tar.gz"
      sha256 "3a28a4c16bbd4bb7ded8be98f0a2fa9b70003d7bb500647e31f12738044609a8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.6.1/claudewatch_0.6.1_linux_arm64.tar.gz"
      sha256 "7dbf0b7f7e302be60ebb565dda487626889149a436842064483dcccb628a3eed"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.6.1/claudewatch_0.6.1_linux_amd64.tar.gz"
      sha256 "ead9d68d12d8397873aad4727ae74afdaaa755d57929bc8b81d6f3716e46e982"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
