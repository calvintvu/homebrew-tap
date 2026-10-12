class Coslash < Formula
  desc "Attention layer for coding agents"
  homepage "https://github.com/centauri-ai/coslash"
  license "MIT"

  depends_on :macos

  # `brew audit` rejects url/sha256 inside on_arm/on_intel, so the architecture
  # is resolved here instead.
  if Hardware::CPU.arm?
    url "https://github.com/centauri-ai/coslash/releases/download/v0.2.1/coslash_v0.2.1_darwin_arm64.tar.gz"
    sha256 "99108737da32a54c13e8f3e82771e19471bf54e4a8b76c4d41081ca5d683ce98"
  else
    url "https://github.com/centauri-ai/coslash/releases/download/v0.2.1/coslash_v0.2.1_darwin_amd64.tar.gz"
    sha256 "78c739f6dc0f512aee72b1ff29204d72fdfd77837995a7fb07823afc7cdf18ea"
  end

  def install
    bin.install "coslash"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/coslash --version")
  end
end
