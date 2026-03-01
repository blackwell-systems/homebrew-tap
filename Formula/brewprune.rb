class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.3.0"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.0/brewprune_0.3.0_darwin_arm64.tar.gz"
        sha256 "0ca866f1c596f538efae5b060cbaa6376f6a1b5fe6aa5985294e1afb55439fa3"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.0/brewprune_0.3.0_darwin_amd64.tar.gz"
        sha256 "37e9974f58ccb47de22f9921972d9759889fcc3a50556e2921e96e182a16fc5a"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.0/brewprune_0.3.0_linux_arm64.tar.gz"
        sha256 "ccd40b253ead2c4a6818469803f5d39a168f9ff338930334930625b4e62e029a"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.0/brewprune_0.3.0_linux_amd64.tar.gz"
        sha256 "71ad3d50487878ce1fc40b83ee308c1456bfcae42445cda2b9b9b3270373da2a"
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
