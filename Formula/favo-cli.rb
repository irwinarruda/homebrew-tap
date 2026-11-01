class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.3.0/favo-darwin-arm64.gz"
      sha256 "92b405d2ef3581c5a9d5c712a4e1e2f78c7a23528c749a77a2faecbccd1b2207"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.3.0/favo-darwin-x64.gz"
      sha256 "150a58e3531a7699cd9c6e08f32aa8982436f2a92ee48d4b9fbae69bebbf214a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.3.0/favo-linux-arm64.gz"
      sha256 "c9f6c069d05de4e0faf44a09c8646dc992aa8f387dcafd5d995e16c6402ac51d"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.3.0/favo-linux-x64.gz"
      sha256 "cf2970455aad52a3691f30a0467a20faaa093e70624b0cedaf10a74ec78d427a"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
