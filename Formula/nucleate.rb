# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.14.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.14.0/nucleate-v0.14.0-aarch64-apple-darwin.tar.gz"
      sha256 "b66509384943919c13d32a20ac489ac37feb54999dd8a7dc915aba7b1994dbe0"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.14.0/nucleate-v0.14.0-x86_64-apple-darwin.tar.gz"
      sha256 "adbf3ca02b05e7f845ff1b7bb421655e0111f93363e380d4258451ef9be9c418"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.14.0/nucleate-v0.14.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "d16dede0971900b35ef2ad34b1af3d1aac2909a8c20ba8fca04494ee01de0f86"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.14.0/nucleate-v0.14.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "61459b59f45446b6e93754f176f9aa9379b0af3961b18880d65e411eb018d93e"
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
