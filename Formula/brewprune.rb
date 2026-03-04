class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.3.4"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.4/brewprune_0.3.4_darwin_arm64.tar.gz"
        sha256 "d62e329c83edc0fea4d6344a2cf4135fd1fef669734770bb3a9bc323c4a20ec5"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.4/brewprune_0.3.4_darwin_amd64.tar.gz"
        sha256 "a4df2ca53107a20af8411b3ad524b28b5f79baa77abaff229fd70bb7a95bd42d"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.4/brewprune_0.3.4_linux_arm64.tar.gz"
        sha256 "1780f8b83484b106e83fb7ad61e87a7cdacfec31efe92434548e5331f98a4969"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.3.4/brewprune_0.3.4_linux_amd64.tar.gz"
        sha256 "ccbdfa76dafbd5801649917b5e71619a82b7dd6d5ef7b0cb6acb679bf430fd93"
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
