class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.16.0/favo-darwin-arm64.gz"
      sha256 "eb0b5615fb1fb85d284eb02c84e7e5b7c77c7a297017cf29c525f6f5a4e22491"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.16.0/favo-darwin-x64.gz"
      sha256 "1a7cbbf1bbdf763c3ac2655b5bd8a9da0a6df8fd4787b82afdaad5e59cd2fe43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.16.0/favo-linux-arm64.gz"
      sha256 "0a9bb16621fefa128beb85378f0acc37107b79466fb760ffa5e05a6554a110c3"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.16.0/favo-linux-x64.gz"
      sha256 "22994ed69a6cf91aec6fe09b7f7e375cc707b9e338ebe854f89f0a446779c3df"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
