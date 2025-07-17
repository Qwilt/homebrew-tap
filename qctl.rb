class Qctl < Formula
  desc "Qwilt Open Edge CLI"
  homepage "https://github.com/Qwilt/qctl"
  url "https://github.com/Qwilt/qctl/archive/refs/tags/v#{version}.tar.gz"
  version "0.18.0"

  if Hardware::CPU.arm?
    url "https://github.com/Qwilt/qctl/releases/download/v#{version}/qctl_darwin_arm64"
    sha256 "69ec312c1e09ca3d62adcd450bbe52a9c343958645457d1b037b197bdfbf3576"
  else
    url "https://github.com/Qwilt/qctl/releases/download/v#{version}/qctl_darwin_amd64"
    sha256 "13b02512c3b6289f9bc74a9a00c0f3b21cf1275345def51693ac341c03589137"
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
