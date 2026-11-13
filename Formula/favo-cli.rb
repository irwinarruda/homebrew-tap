class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.15.0/favo-darwin-arm64.gz"
      sha256 "eb28457cb4fddab5cd0cf853e786e542c2d0eac913702a7f404f5eb0cb53b397"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.15.0/favo-darwin-x64.gz"
      sha256 "5d0845fe25e118b40d6ff8dc2b8fe86b41eb05f8f6237864da98de14c80ab52d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.15.0/favo-linux-arm64.gz"
      sha256 "276966563777907799c813bede2e9f69f448bbe9fa4a88f28f787cc60689c8c5"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.15.0/favo-linux-x64.gz"
      sha256 "b3c90691b5e9c889ba2bbfef4f0e3e5a4c2b256b6fc1270cc7920c3d33e997f6"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
