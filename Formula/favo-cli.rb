class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.5.0/favo-darwin-arm64.gz"
      sha256 "a8b14d4107f6129bf7cfe28134c24e05814b6e67912a945438c015247cd92621"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.5.0/favo-darwin-x64.gz"
      sha256 "2a7e9747d714e5a69d65962dfe9dadcb84f90dcdb37df9b99687baf9f5517a93"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.5.0/favo-linux-arm64.gz"
      sha256 "a4995337712e0a557e0ec74d9a7bc691bd49d5cca717a7840ef92695877f64b2"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.5.0/favo-linux-x64.gz"
      sha256 "c5c92242eb56df7215da9a8ecd04f5c03f435313ba98d1d95034376d25499edd"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
