class Bili < Formula
  desc "Resumable Bilibili CLI downloader with keyword search and JSON output"
  homepage "https://github.com/chick26/bilibili-downloader-cli"
  version "0.2.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chick26/bilibili-downloader-cli/releases/download/v0.2.0/bili-v0.2.0-macos-arm64.tar.gz"
      sha256 "fc2b27f97c247a136d0c62258cefd31543c7c30e974c5b83b60eec1bbdda5d2b"
    end
    on_intel do
      url "https://github.com/chick26/bilibili-downloader-cli/releases/download/v0.2.0/bili-v0.2.0-macos-x86_64.tar.gz"
      sha256 "c0034f5ae40e28538a7e60afdb835a06232d9e1f9fd7e4983b26b80857589523"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chick26/bilibili-downloader-cli/releases/download/v0.2.0/bili-v0.2.0-linux-arm64.tar.gz"
      sha256 "8077361dc424c0d9894a4baca13a6c1bd3c7f195d85422cae5b36400324a16a3"
    end
    on_intel do
      url "https://github.com/chick26/bilibili-downloader-cli/releases/download/v0.2.0/bili-v0.2.0-linux-x86_64.tar.gz"
      sha256 "a1598c8ffe292b3bde8fbe4c1d17f1d1ce35cc490a2d38134bae040aec5292f4"
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
    assert_match "--type", shell_output("#{bin}/bili search --help")
    response = JSON.parse(shell_output("#{bin}/bili --data-dir #{testpath}/state auth status --json"))
    assert_equal true, response.fetch("ok")
  end
end
