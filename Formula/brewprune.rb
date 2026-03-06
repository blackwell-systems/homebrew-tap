class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.3.5"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.5/brewprune_0.3.5_darwin_arm64.tar.gz"
        sha256 "64ef95b59c134615232da1a6cf531d42600689598df70c66c0b8d3aa3e39c998"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.5/brewprune_0.3.5_darwin_amd64.tar.gz"
        sha256 "6cd893973bc78940ba9c05c4b148cdf80bbe880e29e515b0236e8fe6be60b1ee"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.5/brewprune_0.3.5_linux_arm64.tar.gz"
        sha256 "5faf22c0359dec28f3c6a3b92bb070cef27b4d1cbd03c40d7613d250d5f72975"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.5/brewprune_0.3.5_linux_amd64.tar.gz"
        sha256 "98a6395b807e32df43e8a03075b2f7535b3b2a839643ca902b5d6543c5afe94d"
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
