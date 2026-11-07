class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.12.0/favo-darwin-arm64.gz"
      sha256 "738ea50065a3800d4114a61eee036e07d26d81601ac41ced9be59346d24db79f"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.12.0/favo-darwin-x64.gz"
      sha256 "db73beab10d5c78eb05b8e0c50a1ca2dcc4cf59bf31aaab40bf17e2007e7ccee"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.12.0/favo-linux-arm64.gz"
      sha256 "fb535ded9395cebc48b3f66ea0ade8964b3aeebe41df0bd8b36b015e7cc3e223"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.12.0/favo-linux-x64.gz"
      sha256 "9857e28e8df7da36c2506a01f6e6aa56524dc93edd1151e573087f509ff9e5d7"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
