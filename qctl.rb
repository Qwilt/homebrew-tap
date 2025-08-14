class Qctl < Formula
  desc "Qwilt Open Edge CLI"
  homepage "https://github.com/Qwilt/qctl"
  url "https://github.com/Qwilt/qctl/archive/refs/tags/v#{version}.tar.gz"
  version "0.20.0"

  if Hardware::CPU.arm?
    url "https://github.com/Qwilt/qctl/releases/download/v#{version}/qctl_darwin_arm64"
    sha256 "3f739b3fd9db040f361022aad208cbd733641bc19cbc8e207e4f12221f48d96d"
  else
    url "https://github.com/Qwilt/qctl/releases/download/v#{version}/qctl_darwin_amd64"
    sha256 "bab3159d35719987564d63376b8bde4fdafee62b4265e772ea33736273c0bb7b"
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
