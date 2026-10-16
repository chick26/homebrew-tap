class Bili < Formula
  desc "Resumable Bilibili CLI downloader with keyword search and JSON output"
  homepage "https://github.com/chick26/bilibili-downloader-cli"
  version "0.2.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/chick26/bilibili-downloader-cli/releases/download/v0.2.1/bili-v0.2.1-macos-arm64.tar.gz"
      sha256 "77fdd9ef06e61131534b8f6550629aae7a0d6bd7184819c711251c605c460112"
    end
    on_intel do
      url "https://github.com/chick26/bilibili-downloader-cli/releases/download/v0.2.1/bili-v0.2.1-macos-x86_64.tar.gz"
      sha256 "dfc46d3e201a197db2146da3a7906e605324a44bece0bc25d3660a33f2175ea2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/chick26/bilibili-downloader-cli/releases/download/v0.2.1/bili-v0.2.1-linux-arm64.tar.gz"
      sha256 "a361954e61bf2675e6c52004c899a3ab6513d1c66c4dcaa8692e6bd9dd56cb6e"
    end
    on_intel do
      url "https://github.com/chick26/bilibili-downloader-cli/releases/download/v0.2.1/bili-v0.2.1-linux-x86_64.tar.gz"
      sha256 "427b6276512478249e582b7a326b42b0ebb56e558f9c2b321004e6c07bac1447"
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
