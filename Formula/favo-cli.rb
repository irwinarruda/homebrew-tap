class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.4.0/favo-darwin-arm64.gz"
      sha256 "02ae9f699bc6da38bde2367f461652d8d63283f80ad2846b11cb55ea5aea051b"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.4.0/favo-darwin-x64.gz"
      sha256 "2c1b8d18e9a04b584f5bae8edf5efa28040364a32b18420e134f9d1d8ef5cf55"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.4.0/favo-linux-arm64.gz"
      sha256 "81f9af5a064fb4ffcaa4323a6dcd226717223084a79d517c037c11b1b1380518"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.4.0/favo-linux-x64.gz"
      sha256 "34614473ccc2c7b2eb48820db747c889c108e3afae0c3e1c8a2ce8e527642b36"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
