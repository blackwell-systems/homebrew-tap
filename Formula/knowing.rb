class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.7.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.7.1/knowing_darwin_arm64.tar.gz"
      sha256 "7389aaee0a3ca1b714940e4cc4522cb8eb6d34f1dce3022515f2292712b82a03"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.7.1/knowing_darwin_amd64.tar.gz"
      sha256 "b8b5d530deede128be4bd28fc56a1a15cbff99ce0443d0f00d301a19da483474"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.7.1/knowing_linux_arm64.tar.gz"
      sha256 "36018872f725cba3aa8ce24590647c3c7673beb63151d21060fad392954a561c"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.7.1/knowing_linux_amd64.tar.gz"
      sha256 "f59e7a5908f1d485dc82652ec09506487eae6ac4f1c1e86c669546fbd084e6e7"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
