class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.2.0/favo-darwin-arm64.gz"
      sha256 "de1e5d734a5de1c57e0392e5075d051776ca33373bb811b3d13488102542dab4"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.2.0/favo-darwin-x64.gz"
      sha256 "2582016fa08e595591d85dd379230afec1a23f9d3b6396cae5251d3f4a864aae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.2.0/favo-linux-arm64.gz"
      sha256 "67a164a0ad2fbca318a93894d330016e422c94f9d4e5eda70cc264223f47540e"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.2.0/favo-linux-x64.gz"
      sha256 "5c02c2bc5ca6d0bf2a126929f92ca37e3f91231bf8a88a06f63262a23a8ff10e"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
