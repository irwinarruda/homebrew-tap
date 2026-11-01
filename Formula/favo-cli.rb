class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.1.1/favo-darwin-arm64.gz"
      sha256 "65bef1eb93e627b8a0b0acf8d1a6224299dc004880b80c972f0e923f7f4378ef"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.1.1/favo-darwin-x64.gz"
      sha256 "ab410bd83f9eb4a2e77a1cc0a94143537a3ff20037bb947b472b90066e11c195"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.1.1/favo-linux-arm64.gz"
      sha256 "1e291827269a475b423f2329a31d6cea8a7404b63247cb8dcc2d249e958bf878"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.1.1/favo-linux-x64.gz"
      sha256 "e198dff32f0df317033b2a9691e3729f70898e0ebd76b1773d267186a01c594e"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
