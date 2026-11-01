class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.1.2/favo-darwin-arm64.gz"
      sha256 "e757571b5e54ab803217b7bda2186ef92bac36448f31c7615c8739f994bdc0c5"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.1.2/favo-darwin-x64.gz"
      sha256 "d09423e45ac5e995589ffb1c330cd7d36315b96b5284e5c5df4039f4d607f5fc"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.1.2/favo-linux-arm64.gz"
      sha256 "fdae7f44771b5089b6113166ea0424cca1c661b6d6a2ff87904418da0f6857d1"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.1.2/favo-linux-x64.gz"
      sha256 "0c4fc2cc9d5b618a7c28899c4dfcc9a512fe8d9be99c61a81999997d689cc96a"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
