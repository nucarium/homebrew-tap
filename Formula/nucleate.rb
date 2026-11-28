# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.17.2"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.17.2/nucleate-v0.17.2-aarch64-apple-darwin.tar.gz"
      sha256 "7e922d61bd6da70ae01b9a8051f72bbb88ceb8cfc5124dfa5203375d6513dbf2"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.17.2/nucleate-v0.17.2-x86_64-apple-darwin.tar.gz"
      sha256 "b48f3cdbc8545f1457479e9fb5c459ee11ffb10af6773104ccae2c47e7ea1e2e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.17.2/nucleate-v0.17.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "3888d41867161d746d987aaa8d1ddbbeb719d7db5b989a7120f347ef4c7d1bc4"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.17.2/nucleate-v0.17.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "38b1c8fa9ea4cdfeebff03bbdc2af3cb3c862220511a6bf0a0a9f4aff2cb2e38"
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
