# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.11.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.11.0/nucleate-v0.11.0-aarch64-apple-darwin.tar.gz"
      sha256 "ffa3306064da3609b6735af9c63c36fb2648e27fdde808a2f5d7578009b48086"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.11.0/nucleate-v0.11.0-x86_64-apple-darwin.tar.gz"
      sha256 "ce90f2cbfd0e352e6346f4377529ccc11560b093d1423c9a69f3383f139a0812"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.11.0/nucleate-v0.11.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3b17b05cc95cf7b8ebb225bfb58b322d691f567760760453f4a413aedac8845d"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.11.0/nucleate-v0.11.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "70f2e9fd00db1dbf0bf17aeef41fb35c263d8309ab8b9f72d0ac43796e00b497"
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
