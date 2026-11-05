class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.10.2/favo-darwin-arm64.gz"
      sha256 "1f3775248515e4ee3607be541f7568f7b6e4b02fffe38753da2863c75e22679e"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.10.2/favo-darwin-x64.gz"
      sha256 "cc74fefa4471bb5319719c5cd630f6f6d11b8488cbfab5307f71a54a58c71d2a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.10.2/favo-linux-arm64.gz"
      sha256 "353f733f7866bc346289d8e8ae26acb6c4344ee137dca449b2e42f72b2973d04"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.10.2/favo-linux-x64.gz"
      sha256 "57702f2166279f5e68aa0b62012b696794484ff42622cd430f24230d47abb85e"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
