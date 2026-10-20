class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.3.0/coslash_v0.3.0_darwin_arm64.tar.gz"
    sha256 "c8859ffa8f420705816d8e84f9e526386d0732e83d896c8939db879d0a53ef40"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.3.0/coslash_v0.3.0_darwin_amd64.tar.gz"
    sha256 "da7481dbde4992aaabf882b45ac7f07f286228dc2315f02af95e70c3c6006dc2"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
