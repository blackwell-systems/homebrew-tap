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

    # TODO: DRAFT — Do NOT release until Wave 2 Agent E ships.
    # The post_install block references `brewprune scan --refresh-shims` which does not
    # exist in the binary yet. The --refresh-shims flag ships in Wave 2. Once released,
    # update the post_install block below and remove this TODO.
    service do
      run [opt_bin/"brewprune", "watch", "--daemon"]
      keep_alive true
      log_path var/"log/brewprune.log"
      error_log_path var/"log/brewprune.log"
    end

    def post_install
      # TODO: --refresh-shims flag ships in Wave 2. Change to scan --refresh-shims once released.
      system bin/"brewprune", "scan"
    end

    def install
      bin.install "brewprune"
      bin.install "brewprune-shim"
    end

    test do
      system "#{bin}/brewprune", "--version"
    end
  end
