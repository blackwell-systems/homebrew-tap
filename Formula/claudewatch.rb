class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.1.0/claudewatch_0.1.0_darwin_arm64.tar.gz"
      sha256 "00ef2c8817fbe6e8d398442396e506fbc26b47430a0120ae415139dd3fb7c4e3"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.1.0/claudewatch_0.1.0_darwin_amd64.tar.gz"
      sha256 "7bb559a8d5e0693a1cbf219a3de4c4136fb43a22f36c0a176d23f72e788a3747"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.1.0/claudewatch_0.1.0_linux_arm64.tar.gz"
      sha256 "226c72e3d17138f23b13bb94af398c3bbf6eed9941685416133635ca8b2b78ac"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.1.0/claudewatch_0.1.0_linux_amd64.tar.gz"
      sha256 "ebc453ff33792aff329ea3aae0077518870982078a254a8664b19d3780833c57"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
