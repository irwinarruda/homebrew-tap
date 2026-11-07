class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.13.0/favo-darwin-arm64.gz"
      sha256 "5424f2bfc48972d3e7b589bf10672b2d308002667cf7917eedb18f6161649b72"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.13.0/favo-darwin-x64.gz"
      sha256 "d28ff56cd50e3f2504825d78d5516b775c7742fb355ed69c906d5f03ec9a4437"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.13.0/favo-linux-arm64.gz"
      sha256 "c0641b05eb87d2d174114fe23bdf773b44a0564855854d9f41456488c8e688bc"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.13.0/favo-linux-x64.gz"
      sha256 "b91903151401cf5221489adfc854d622962e243c3b7425c9fe5ea003a3aad42a"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
