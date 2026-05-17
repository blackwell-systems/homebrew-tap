class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.1.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_darwin_arm64.tar.gz"
      sha256 "d7c44c47283d4ed6e89fd66caa8752f85d361564b66363c06555d894b7b19554"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_darwin_amd64.tar.gz"
      sha256 "64cef5c80a03bb1b0f369d7e211cfc8aeef67d1bd581f09cc89f4a594dc25fe9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_linux_arm64.tar.gz"
      sha256 "050b3f1548e67ffd253680eb97675f1e62e66377f2bfc23299d34f51fa43ce16"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.1.0/knowing_linux_amd64.tar.gz"
      sha256 "8ef99229a23f701e4aef15f21573047acab49b96fa35af6f85815fb4d2b036f4"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
