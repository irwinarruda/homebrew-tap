class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.8.0/favo-darwin-arm64.gz"
      sha256 "e06f6a7a73f1fbddae745a4a61061502ea2d0a2efa0e8f1e77bf66b20e57b517"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.8.0/favo-darwin-x64.gz"
      sha256 "0757d4ee5a0086996a512fdaf390998d69dbaa7ee82ce7828f1dc7ba60da5d44"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.8.0/favo-linux-arm64.gz"
      sha256 "60e7b632d675619fd0d669e2ae2fc49c322de32fbbba9465a61054b96b3d7102"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.8.0/favo-linux-x64.gz"
      sha256 "f5db07144ab3b12d6a95a231b418f5c50a0293729bda1895780500be331bce5b"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
