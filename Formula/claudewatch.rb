class Claudewatch < Formula
  desc "Observability for AI-assisted development workflows"
  homepage "https://github.com/blackwell-systems/claudewatch"
  version "0.7.5"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.5/claudewatch_0.7.5_darwin_arm64.tar.gz"
      sha256 "23bbf17028f03c4a0b94a71343fe8927fd5e0dc1e3d620e176889480486e6787"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.5/claudewatch_0.7.5_darwin_amd64.tar.gz"
      sha256 "45e6640109286c4b59623be7e654a8da7be3e74448440d29d2747cdf52747f62"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.5/claudewatch_0.7.5_linux_arm64.tar.gz"
      sha256 "873bb86b6ff97f42d71254d2e623a6f7246fb4aa0f4cfedf8bd326e02eb5961e"
    end
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/claudewatch/releases/download/v0.7.5/claudewatch_0.7.5_linux_amd64.tar.gz"
      sha256 "cb3d0c94c3ced08737e5e079a8382191fb6ea4b41fa88103c88b45f98472e712"
    end
  end

  def install
    bin.install "claudewatch"
  end

  test do
    system "#{bin}/claudewatch", "--version"
  end
end
