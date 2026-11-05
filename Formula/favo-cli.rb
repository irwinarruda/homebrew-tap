class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.10.1/favo-darwin-arm64.gz"
      sha256 "39ec9953377dfdec1785fc6594796535c6e9742dc262e668186e317cb296e90d"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.10.1/favo-darwin-x64.gz"
      sha256 "6985535dd85d96b9dc33c121f0e7b35fd9ed5cb3c14fef8069627a2b763f2fa4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.10.1/favo-linux-arm64.gz"
      sha256 "5f8234bb78a0f095e3c50a6cde4b4501195ebae60e7b3fc167d9c69993c84e60"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.10.1/favo-linux-x64.gz"
      sha256 "53d73d69befa7d1edc4d6a2e31691d1a838ddd72a7d4470d437fe758949bf380"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
