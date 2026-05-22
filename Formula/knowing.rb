class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.6.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.2/knowing_darwin_arm64.tar.gz"
      sha256 "f6a4828c16e732270f72e70b40aa73136cbab73375258995568c38316ae7615b"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.2/knowing_darwin_amd64.tar.gz"
      sha256 "58a1fb83eba609de1bd618589fecf4e5c7707bc55b9266e2c9787ee8f090be33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.2/knowing_linux_arm64.tar.gz"
      sha256 "a8c416193fa53c628070cc5e113ec1a5f7e6d358142494faaa23bc47cd4b72f0"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.2/knowing_linux_amd64.tar.gz"
      sha256 "4fbb86d59c41a00b06b1605847c4ca3a19f13542750aaea08844a6f2cf0e093b"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
