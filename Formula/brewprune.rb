class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.2.2"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.2.2/brewprune_0.2.2_darwin_arm64.tar.gz"
        sha256 "121c42eb0076a1565fe57471de3732d82eeebdd52071b4d4d3993e8762456ad3"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.2.2/brewprune_0.2.2_darwin_amd64.tar.gz"
        sha256 "a7e2c34a3cdbd456cf4421dd82a155fb1719d009d10c5827a9ee0f1ce4f53cde"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.2.2/brewprune_0.2.2_linux_arm64.tar.gz"
        sha256 "79060c521527b2526f34577dfca7a97d6fb92cd8fbbcaa6035cb3e3aeb7232e6"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.2.2/brewprune_0.2.2_linux_amd64.tar.gz"
        sha256 "3b5aec9ea9cd8b5b4691bfde55393cb528531950771e6159808bde14d9b28ca5"
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
