class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.3.3"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.3/brewprune_0.3.3_darwin_arm64.tar.gz"
        sha256 "2287077a6dbeb38371809b98681b16f4d51d8cce167ffd9190248de326ec7309"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.3/brewprune_0.3.3_darwin_amd64.tar.gz"
        sha256 "a16a55b20a560c078e64fedc41716996dad27aae507ccb49873460b9d405f51b"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.3/brewprune_0.3.3_linux_arm64.tar.gz"
        sha256 "8a1a43b83a9a71a9b91c8677c81b3e0967e05c7efd6b31dc86cf114d6e5fcf32"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.3/brewprune_0.3.3_linux_amd64.tar.gz"
        sha256 "734a4dde0d2e0fb0ddb5a868c07882b42053c63f0da5912ff150c3650a685ca1"
      end
    end

    service do
      run [opt_bin/"brewprune", "watch", "--daemon"]
      keep_alive true
      log_path var/"log/brewprune.log"
      error_log_path var/"log/brewprune.log"
    end

    def post_install
      # Fast path: rebuild shim binary and refresh symlinks without full rescan.
      # Safe to run on every brew install/upgrade — skips dep tree rebuild.
      system bin/"brewprune", "scan", "--refresh-shims"
    end

    def install
      bin.install "brewprune"
      bin.install "brewprune-shim"
      zsh_completion.install "completions/brewprune.zsh" => "_brewprune"
      bash_completion.install "completions/brewprune.bash"
      fish_completion.install "completions/brewprune.fish"
    end

    test do
      system "#{bin}/brewprune", "--version"
    end
  end
