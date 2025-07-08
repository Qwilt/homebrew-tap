class Qctl < Formula
  desc "Qwilt Open Edge CLI"
  homepage "https://github.com/Qwilt/qctl"
  url "https://github.com/Qwilt/qctl/archive/refs/tags/v#{version}.tar.gz"
  version "0.12.0"

  if Hardware::CPU.arm?
    url "https://github.com/Qwilt/qctl/releases/download/v#{version}/qctl_darwin_arm64"
    sha256 "d7c48e05ac154a2b9921ad8fdfbc1f3eb5cc69e7bdc012e1317d95ab33608efd"
  else
    url "https://github.com/Qwilt/qctl/releases/download/v#{version}/qctl_darwin_amd64"
    sha256 "e4a7a38e9b7cc59c522caad66428b67acc9a5d38de9821682e5613cbb9b40898"
  end

  def install
    arch = Hardware::CPU.intel? ? "amd64" : Hardware::CPU.arch.to_s
    os = OS.kernel_name.downcase

    bin.install "qctl_#{os}_#{arch}" => "qctl"
  end

  test do
    system "#{bin}/qctl", "version"
  end
end
