class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.1.0/favo-darwin-arm64.gz"
      sha256 "5321a989bd15c2eca120c8bf134662f42e9217f34822311fa7206815ba94c0d3"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.1.0/favo-darwin-x64.gz"
      sha256 "ed4b1cf0a9663741e866431430cca02e70bcf73bfc22505ce3c1a398a97fa2f2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.1.0/favo-linux-arm64.gz"
      sha256 "3ab23025eeaa601097594af89375266b74138ef7b2e462fb506f91db32d6a149"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.1.0/favo-linux-x64.gz"
      sha256 "86c7a9cdb2337d1519d4312b8abe6480349c0eb2bb6ceda6f075e91b261d7440"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
