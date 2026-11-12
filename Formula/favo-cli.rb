class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.14.1/favo-darwin-arm64.gz"
      sha256 "2b57c424b9adfb9ec8748f757c952d1c8759f7b12f753510826c8ca0222a874f"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.14.1/favo-darwin-x64.gz"
      sha256 "6b5e8c70a321f3cae63090587fa7639c322ac83a8434ec01edb6d534f780d74e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.14.1/favo-linux-arm64.gz"
      sha256 "b0adc9f93744b63a8577c7c38b57ee6d0c09210f9a65e1edd61a3e59bb4f4bfe"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.14.1/favo-linux-x64.gz"
      sha256 "aadd811af49eec604185c5a67cb450320e3169a938d2855aec4381befe06fb99"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
