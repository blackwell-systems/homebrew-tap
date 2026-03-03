class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.3.2"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.2/brewprune_0.3.2_darwin_arm64.tar.gz"
        sha256 "515e3a803fe752bce1ef4770e11ab6c89011deca26510819167b426e7f0a8220"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.2/brewprune_0.3.2_darwin_amd64.tar.gz"
        sha256 "3306ad1627ef7c98cad728226176606af1b46ab9b0c06d8da7da07691b604cb5"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.2/brewprune_0.3.2_linux_arm64.tar.gz"
        sha256 "610914c25a7790d5d2db66807ae83ba97ae784fc2648639964bf832a468a3512"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.2/brewprune_0.3.2_linux_amd64.tar.gz"
        sha256 "caacc1639bd6fdadc67aa6acf7ec5a412db55b19e243a2a86b4652ad1d602d01"
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
