class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.11.0/favo-darwin-arm64.gz"
      sha256 "00a1a96a8520c4d7fea17d5fa5890aca70eadaf2d83a5148a8e42d47ab665535"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.11.0/favo-darwin-x64.gz"
      sha256 "c5d6c1e0f66e359206296dc5aa98ed0e7985b6b9921425b9bcb078a6ab2c2c99"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.11.0/favo-linux-arm64.gz"
      sha256 "77aaed151f9c1c6dd3ba4c73a03eb924c7cabbb701da33bbe45d3595a9a11fb9"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.11.0/favo-linux-x64.gz"
      sha256 "9af4c7b50ebcd40fb9b264ae7ed6d17b4053cb043a99b56efb17aa36cea80188"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
