class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.0/knowing_darwin_arm64.tar.gz"
      sha256 "405618e4fc633439728cf8a104f617ac517dab1fc63410c9d34adccb707f7235"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.0/knowing_darwin_amd64.tar.gz"
      sha256 "1fbe3f271a0a4cfeec60fd72357a1311dc4c60b587de3486e478bd31c1221fbd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.0/knowing_linux_arm64.tar.gz"
      sha256 "d560c2af592be359f5075d99979d433fb4fb8195c67feef69c803acac36612ce"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.0/knowing_linux_amd64.tar.gz"
      sha256 "a4be4dbe6adf494e25350e935598aca9020229095c9c4317bac63fab4e809fef"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
