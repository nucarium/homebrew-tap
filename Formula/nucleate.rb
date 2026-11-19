# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.4.2"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.4.2/nucleate-v0.4.2-aarch64-apple-darwin.tar.gz"
      sha256 "423963e112093f843f1d2a84ef3350a53b68caeacca5037111dd11a29f0a2932"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.4.2/nucleate-v0.4.2-x86_64-apple-darwin.tar.gz"
      sha256 "9f92474fc605295d79bfd31c63817aab75763d94b88adef44bad834a601a00bf"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.4.2/nucleate-v0.4.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1f49d94f7f7bd2c4f68bc420c28947c0c085d8ea942ed0725ddee6c0c3d27fa7"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.4.2/nucleate-v0.4.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ec9cb55d7ae3379d925fe2b4b85a0f2396bf6425e82a07cf78663861187118a5"
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
