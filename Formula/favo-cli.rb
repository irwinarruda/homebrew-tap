class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.14.0/favo-darwin-arm64.gz"
      sha256 "a130d624f82db1f07b2e5a2c19bb6a5529aa24c14389e8913ecbbd67acd20ac1"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.14.0/favo-darwin-x64.gz"
      sha256 "5b58607c9bec9114ac89e4b7f0a43f30d0f9f4883fac200696017a07eb03167d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.14.0/favo-linux-arm64.gz"
      sha256 "091f413bf19cd5eb74e8837199df364ae0327993059b262e2d0dc46a5a13f18d"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.14.0/favo-linux-x64.gz"
      sha256 "ebf153d33bc04c3d8bcd7b86cec8fc5f49322d6d7d2d67138ad61956deef8a7b"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
