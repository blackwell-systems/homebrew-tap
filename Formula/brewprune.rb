class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.3.1"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.1/brewprune_0.3.1_darwin_arm64.tar.gz"
        sha256 "f7e6fd2100880b5aebac97836f6b2c02f65bc0c4a63d31a6468ed2a59e66eda5"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.1/brewprune_0.3.1_darwin_amd64.tar.gz"
        sha256 "fb45739444b6a4b66acd1c729acd58c9bc6da8b5d9478437c5403a783777c492"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.1/brewprune_0.3.1_linux_arm64.tar.gz"
        sha256 "85636b774a60b2bd72be32a7f6caf80f27b43989e64119eb5eb9d2e2d9bb943b"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.1/brewprune_0.3.1_linux_amd64.tar.gz"
        sha256 "5c26beb8a978d2c105a940e20340472f20142866c294bb34bdbc53f40e1e85e4"
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
