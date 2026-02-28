class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.2.1"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.2.1/brewprune_0.2.1_darwin_arm64.tar.gz"
        sha256 "0720609d5265cebcd710315820e38ff13c470070156951c067434ae7763efa70"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.2.1/brewprune_0.2.1_darwin_amd64.tar.gz"
        sha256 "a37be18648fe76725deb32ac7c47e986e3c24c044f600725ba06ecac307a2775"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.2.1/brewprune_0.2.1_linux_arm64.tar.gz"
        sha256 "4d7506c7e58037a190a272ad9b8995f6c77c425cfb653ddf234bc84926eb9af4"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.2.1/brewprune_0.2.1_linux_amd64.tar.gz"
        sha256 "fae70cd79998732e858598fe146239005a5146d3f6d663d5e9036ad753a4a9e6"
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
