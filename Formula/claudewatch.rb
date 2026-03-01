class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.5.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.5.0/claudewatch_0.5.0_darwin_arm64.tar.gz"
      sha256 "20370f5b2c03d9acbb40927fc3b5b581f8813b22c27b70e5c25bbbd1f1c89cba"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.5.0/claudewatch_0.5.0_darwin_amd64.tar.gz"
      sha256 "bfda813431bb72080813e72a864b0d47849adcd959bd01b238c8e6d230a3f6ea"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.5.0/claudewatch_0.5.0_linux_arm64.tar.gz"
      sha256 "0f3501beaf229be535add45443a58f27b813dc93e8214e6624b76030366df474"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.5.0/claudewatch_0.5.0_linux_amd64.tar.gz"
      sha256 "d2aef03b97182144462ef182226830c599b2b1454329a5ba0875d6888e3b4140"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
