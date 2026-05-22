class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.6.3"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.3/knowing_darwin_arm64.tar.gz"
      sha256 "29eae9261cfd02595b8f5e047eabf0ded6c9fe00e421da4261987ec45aacc7a7"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.3/knowing_darwin_amd64.tar.gz"
      sha256 "91d4456ca61508870411526ed3c4f9e936c477a6a4b02c5cd0f20dfa5e93b309"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.3/knowing_linux_arm64.tar.gz"
      sha256 "37d769bf7cb49af2ef191866375df66289bf90b28b998412841221c895b350dc"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.6.3/knowing_linux_amd64.tar.gz"
      sha256 "50aa2004c6ad09f11c713a35728daae79bb92701d896ef7dbe5f657679c3e0fa"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
