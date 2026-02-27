class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.1.5"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.5/brewprune_0.1.5_darwin_arm64.tar.gz"
        sha256 "0725165b7b36c161c148dc243ca6cb03b8c281534362535939e5cbd84e00a5c1"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.5/brewprune_0.1.5_darwin_amd64.tar.gz"
        sha256 "659034efefae09c00fb5172ce034908180ce0c44446ff2c9a26c3c25e1b2432e"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.5/brewprune_0.1.5_linux_arm64.tar.gz"
        sha256 "bee72b1e8f0540918ad90afb9b1e42adaac09303cc0858422976bdc706cb7c10"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.1.5/brewprune_0.1.5_linux_amd64.tar.gz"
        sha256 "8b7089a4318c156d0772a757874feb4c86d6eceb621d196e50ff712c46eb676b"
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
    end

    test do
      system "#{bin}/brewprune", "--version"
    end
  end
