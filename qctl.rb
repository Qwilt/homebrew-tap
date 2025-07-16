class Qctl < Formula
  desc "Qwilt Open Edge CLI"
  homepage "https://github.com/Qwilt/qctl"
  url "https://github.com/Qwilt/qctl/archive/refs/tags/v#{version}.tar.gz"
  version "0.17.0"

  if Hardware::CPU.arm?
    url "https://github.com/Qwilt/qctl/releases/download/v#{version}/qctl_darwin_arm64"
    sha256 "19a479cf7c7f1226b435161e6a49588b4e3c72e03c013d44de0f01b027478ada"
  else
    url "https://github.com/Qwilt/qctl/releases/download/v#{version}/qctl_darwin_amd64"
    sha256 "8f13fa9f7a62b7ae2f4364f5fe83a3cd32cf9f83bbacfbf896d996084a58230c"
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
