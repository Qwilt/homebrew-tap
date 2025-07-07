class Qctl < Formula
  desc "Qwilt Open Edge CLI"
  homepage "https://github.com/Qwilt/qctl"
  url "https://github.com/Qwilt/qctl/archive/refs/tags/v#{version}.tar.gz"
  version "0.11.4"

  if Hardware::CPU.arm?
    url "https://github.com/Qwilt/qctl/releases/download/v#{version}/qctl_darwin_arm64"
    sha256 "e13c7a3aa67088a4e3e009c4d400d78527e57dc2ef3d370b279db24c6918d831"
  else
    url "https://github.com/Qwilt/qctl/releases/download/v#{version}/qctl_darwin_amd64"
    sha256 "c6d79f9db5ab803c654cb7ba902adace2fe60425cdab7aebcbcbdf5a85ce4fa5"
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
