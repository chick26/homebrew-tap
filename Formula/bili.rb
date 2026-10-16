class Bili < Formula
  desc "Resumable Bilibili CLI downloader with UID browsing and JSON output"
  homepage "https://github.com/chick26/bilibili-downloader-cli"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chick26/bilibili-downloader-cli/releases/download/v0.1.0/bili-v0.1.0-macos-arm64.tar.gz"
      sha256 "c4ad250dfccb20da948a7bbdd105afb6c7f43af74748a1defa4ac515c55bc7b8"
    end
    on_intel do
      url "https://github.com/chick26/bilibili-downloader-cli/releases/download/v0.1.0/bili-v0.1.0-macos-x86_64.tar.gz"
      sha256 "84bf652cc379dfd26e64ccf66f5075d355740601a8c7d15228e731d17394c8a3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chick26/bilibili-downloader-cli/releases/download/v0.1.0/bili-v0.1.0-linux-arm64.tar.gz"
      sha256 "82d9de01a4e4a9913242d8e2b2b647cf38940242d7db44780b173b37e922a22b"
    end
    on_intel do
      url "https://github.com/chick26/bilibili-downloader-cli/releases/download/v0.1.0/bili-v0.1.0-linux-x86_64.tar.gz"
      sha256 "1c111c7b0a44f9598e04b42d7a6c7abc4aff991f7b7f9bfd3c18bc0e36d3ea74"
    end
  end

  depends_on "ffmpeg"

  def install
    bin.install "bili"
    doc.install "README.md", "UPSTREAM.md"
    pkgshare.install "licenses"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bili --version")
    response = JSON.parse(shell_output("#{bin}/bili --data-dir #{testpath}/state auth status --json"))
    assert_equal true, response.fetch("ok")
  end
end
