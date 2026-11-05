class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.9.0/favo-darwin-arm64.gz"
      sha256 "028b48d2656e09d540b70b03ac750fafd10c5a22560046d8903730177bf22002"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.9.0/favo-darwin-x64.gz"
      sha256 "0bdbdf8bb44432a511090b96dfb1bbac98d7a5ebb22d09081e64f5d22d7dd287"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.9.0/favo-linux-arm64.gz"
      sha256 "0ec15f5e37b30d4a8b68fd82bf3f25a62f829338f949ce6dd3379a005dca984a"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.9.0/favo-linux-x64.gz"
      sha256 "1840959ef0d6fd21f9d601731749637e7b4a81748a9e72bdb7212fbd155c0434"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
