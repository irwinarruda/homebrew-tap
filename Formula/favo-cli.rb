class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.10.0/favo-darwin-arm64.gz"
      sha256 "625e1e19d5ab38a8253938fc9fc31e4fd06bc0cf947c9a0d697b7f8d5a2fad2e"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.10.0/favo-darwin-x64.gz"
      sha256 "7029d4886d39951c85d75248fe55d025d01b9888a871312be1e5f325712920d6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.10.0/favo-linux-arm64.gz"
      sha256 "dfd2bdac80552115b5c080c9e1a45dd76db2fd591478c150ba879c2d29dcd341"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.10.0/favo-linux-x64.gz"
      sha256 "bdf4a9ded07af5db116460a8e8df8e32eb1c6c7f4410266bc25d03e681d0bf9e"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
