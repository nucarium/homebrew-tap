# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.9.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.9.0/nucleate-v0.9.0-aarch64-apple-darwin.tar.gz"
      sha256 "94b33b6f318cc287b426134ee6c0646b369f77e7467b5da3b1d7361cd2e99eef"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.9.0/nucleate-v0.9.0-x86_64-apple-darwin.tar.gz"
      sha256 "ddf10337c183119ffa66f62e59a9bc6ba11448d831f06b5d533f20ca40ab22b0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.9.0/nucleate-v0.9.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "b0366e1ccdf1fb4ead2b3dc144bb2d1a0ecf68aa5890a7de9ca918dfc8728ecf"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.9.0/nucleate-v0.9.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "39cb848dc889bf9409c9d074f60f97b470a43522953dbeb1dac9c4271c62db5c"
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
