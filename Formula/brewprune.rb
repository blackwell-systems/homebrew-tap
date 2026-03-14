class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.3.6"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.6/brewprune_0.3.6_darwin_arm64.tar.gz"
        sha256 "1838baada6ef63d83bf5482cd57f7fb16a631f12910a0c1356c82559f97de998"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.6/brewprune_0.3.6_darwin_amd64.tar.gz"
        sha256 "3a021998843295260c76e6cd29864be0e0d1728b90560984bea484a1620637f9"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.6/brewprune_0.3.6_linux_arm64.tar.gz"
        sha256 "d789c40430b01132ffaafa6afe401ca60f1d6f136bd119b6633283288a965136"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.6/brewprune_0.3.6_linux_amd64.tar.gz"
        sha256 "b33186bf2f5b3e5b05002e2941c053728cdfee4f994edb5384e7ab5937965f49"
      end
    end

    service do
      run [opt_bin/"brewprune", "watch", "--daemon"]
      keep_alive true
      log_path var/"log/brewprune.log"
      error_log_path var/"log/brewprune.log"
    end

    def caveats
      <<~EOS
        Run 'brewprune quickstart' to complete setup and activate tracking.
      EOS
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
