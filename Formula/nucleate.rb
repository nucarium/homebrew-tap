# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.6.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.6.0/nucleate-v0.6.0-aarch64-apple-darwin.tar.gz"
      sha256 "59028cac42c55635df05502d249856675cded2c26c202db1cee3baa14b92db59"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.6.0/nucleate-v0.6.0-x86_64-apple-darwin.tar.gz"
      sha256 "204f91cb47e75c27c5503e5277784cca47e16e0084f8222b48ec89a1f4fffa50"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.6.0/nucleate-v0.6.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "90bf50db7119983442b5272732d539307f2550e49bae87c493f4028017983443"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.6.0/nucleate-v0.6.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e62bebba9704756730a8eb5054bd512355b9a3b55a19e0654e36e90b1cca0793"
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
