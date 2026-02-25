# typed: false
# frozen_string_literal: true

class Shelfctl < Formula
  desc "Personal library manager for PDFs using GitHub Release assets"
  homepage "https://github.com/blackwell-systems/shelfctl"
  version "0.3.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.1/shelfctl_0.3.1_Darwin_x86_64.tar.gz"
      sha256 "ef20cedaa43d5fbf069ec8d50de641c0813441a9e5bca7795b119530ce89a79e"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.1/shelfctl_0.3.1_Darwin_arm64.tar.gz"
      sha256 "0e617c278dd564f955906e4d6d42734ce19ef8c65f89b8ae55f7e3ade310435e"

      def install
        bin.install "shelfctl"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.1/shelfctl_0.3.1_Linux_x86_64.tar.gz"
      sha256 "7d7895ad985b1c910f8afcb07dd224ca86614618a78462544566104e833a3774"

      def install
        bin.install "shelfctl"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/shelfctl/releases/download/v0.3.1/shelfctl_0.3.1_Linux_arm64.tar.gz"
      sha256 "0f984e6462062e6276ff32ef1549f29c604aed2be0db7ae815e22573bb9f8389"

      def install
        bin.install "shelfctl"
      end
    end
  end

  test do
    system "#{bin}/shelfctl", "version"
  end
end
