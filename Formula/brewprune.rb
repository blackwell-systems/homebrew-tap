class Brewprune < Formula
    desc "Smart Homebrew package cleanup with usage tracking and heuristic-scored removal"
    homepage "https://github.com/blackwell-systems/brewprune"
    version "0.2.0"
    license "MIT"

    on_macos do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.2.0/brewprune_0.2.0_darwin_arm64.tar.gz"
        sha256 "538b364969931538da793ab8d42582fa16340389c4380e47fde61df134259da6"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.2.0/brewprune_0.2.0_darwin_amd64.tar.gz"
        sha256 "def3a5485004546e57c98d8caf5b7c32a830eb678e682bfe11fb2f245ce1e1f7"
      end
    end

    on_linux do
      if Hardware::CPU.arm?
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.2.0/brewprune_0.2.0_linux_arm64.tar.gz"
        sha256 "5e28e9511e5c5933f658618841028ca1c4e0b5f37f94a462bcc735e11ea92d71"
      else
        url "https://github.com/blackwell-systems/brewprune/releases/download/v0.2.0/brewprune_0.2.0_linux_amd64.tar.gz"
        sha256 "170a810511ad91f77c43d0e832b60574a4a3204125eb33a6c42f72885ad5a4dc"
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
