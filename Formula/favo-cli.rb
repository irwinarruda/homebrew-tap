class FavoCli < Formula
  desc "Keep every AI subscription on every computer you own"
  homepage "https://github.com/irwinarruda/favo-cli"
  license "MIT"

  # The release workflow already builds and checksums a binary per target, so
  # the formula installs those rather than compiling on the user's machine.
  # Each release file is one gzipped binary, which Homebrew unpacks by itself.
  on_macos do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.6.0/favo-darwin-arm64.gz"
      sha256 "01e5bc6a42715015587fc24126b15ae1d9d8fb12ab3166412d6098249b2d8189"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.6.0/favo-darwin-x64.gz"
      sha256 "642e3aebecadc6ec601726f76abd0fb224e5d8892cf9da98595b7a46b72c19c4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.6.0/favo-linux-arm64.gz"
      sha256 "743067de547091190a231a184501605a9311a316e636778dc9e74291740a27f1"
    end

    on_intel do
      url "https://github.com/irwinarruda/favo-cli/releases/download/v0.6.0/favo-linux-x64.gz"
      sha256 "ee3156eaa0288d34afcf695919c00797ee647c815fbaf1a72946017e7b83c0eb"
    end
  end

  def install
    bin.install Dir["favo-*"].fetch(0) => "favo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/favo --version")
  end
end
