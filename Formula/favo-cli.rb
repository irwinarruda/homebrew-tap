class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.7.0/favo-darwin-arm64.gz"
      sha256 "623591da00ca145b20b0061f86b7e3a0882a257ca795e4b95c64997aa17ee1c2"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.7.0/favo-darwin-x64.gz"
      sha256 "e9d953b7e57cdd3c26d7b52bfaa6204a79439487886880abaa526d45490849b8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.7.0/favo-linux-arm64.gz"
      sha256 "095514d81d818d8aadf60e6fa62ba86f3b6c29f8dae8b9447c4d29382d58ecb6"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.7.0/favo-linux-x64.gz"
      sha256 "f668bd2a6f69003262144c330c39c71b11da8a8024d7dcae1b62bb845ac35d32"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
