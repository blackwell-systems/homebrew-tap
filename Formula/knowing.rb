class Knowing < Formula
  desc "Content-addressed graph artifact for software systems"
  homepage "https://github.com/blackwell-systems/knowing"
  license "MIT"
  version "0.12.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.12.0/knowing_darwin_arm64.tar.gz"
      sha256 "26f656ff95bd745cbf42f82e7f015e76ee4185cea01cd480878ee9ed45f69446"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.12.0/knowing_darwin_amd64.tar.gz"
      sha256 "ea5abff6d71e99f82ebef29135938d665b48dd31c12f36b4cd2be77f8d2577db"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.12.0/knowing_linux_arm64.tar.gz"
      sha256 "6bd45dc6f35c14b3a44ce932dcd2c0aa89fb97956d4af424192c98f355db1781"
    else
      url "https://github.com/blackwell-systems/knowing/releases/download/v0.12.0/knowing_linux_amd64.tar.gz"
      sha256 "48544b34d0e1b11acd7e707e6edbc84f2aef83137f200534b71ff2e83c6de7f5"
    end
  end

  def install
    bin.install "knowing"
  end

  test do
    system "#{bin}/knowing", "version"
  end
end
