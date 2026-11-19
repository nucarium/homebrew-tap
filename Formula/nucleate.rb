# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.4.0/nucleate-v0.4.0-aarch64-apple-darwin.tar.gz"
      sha256 "cb6069a4611d85bf948520afcba5b399cdf3838b56438f33247afc7a90409950"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.4.0/nucleate-v0.4.0-x86_64-apple-darwin.tar.gz"
      sha256 "4a6eec966bda95aa1f72d6b963ee6aad8b2bf8e73fe6add675d3d15ca26a887c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.4.0/nucleate-v0.4.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c96e740f6b31275b852deb1e07fbe07189ae8a556382e23fbccaf9615e16b292"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.4.0/nucleate-v0.4.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "6285490bf84a80018e51b22e8f0019e43860886cf77deca17fe6033d1eb5b977"
    end
  end

  def install
    bin.install "nucleate", "nucleated"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/nucleate --version")
    assert_match version.to_s, shell_output("#{bin}/nucleated --version")
  end
end
