# typed: false
# frozen_string_literal: true

class Blackdot < Formula
  desc "Developer dotfiles and environment management CLI"
  homepage "https://github.com/blackwell-systems/blackdot"
  version "4.0.0-rc5"
  license "MIT"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/blackwell-systems/blackdot/releases/download/v4.0.0-rc5/blackdot-darwin-amd64"
      sha256 "bd9f852781f1602f6b22cd20c50defabfcb2725661c02517a110ac54207f45b1"

      def install
        bin.install "blackdot-darwin-amd64" => "blackdot"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/blackdot/releases/download/v4.0.0-rc5/blackdot-darwin-arm64"
      sha256 "b882cb02a2d051532c4b4d6f0d4b7eacc9f2bd9fe6fb2e59ffc1afa6a7a555fa"

      def install
        bin.install "blackdot-darwin-arm64" => "blackdot"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/blackdot/releases/download/v4.0.0-rc5/blackdot-linux-amd64"
      sha256 "fbb49c3b23c2fc551510d5f3d4f06986c034884e13d72a5c4063e7baabae377a"

      def install
        bin.install "blackdot-linux-amd64" => "blackdot"
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/blackwell-systems/blackdot/releases/download/v4.0.0-rc5/blackdot-linux-arm64"
      sha256 "32f92a43f985c9bfae849768fc709bd6dc386dd59146eb1b27f87cc6913bb7c2"

      def install
        bin.install "blackdot-linux-arm64" => "blackdot"
      end
    end
  end

  test do
    system "#{bin}/blackdot", "version"
  end
end
