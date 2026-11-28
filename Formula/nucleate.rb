# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.17.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.17.0/nucleate-v0.17.0-aarch64-apple-darwin.tar.gz"
      sha256 "0dab1c474f6c198768e28ee4fbd982be74717e11952fa4128c47384886a8af89"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.17.0/nucleate-v0.17.0-x86_64-apple-darwin.tar.gz"
      sha256 "d618e63452d56b2332adfcc0b0650632e539c1646bb019260ca9fc3079cb5a6e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.17.0/nucleate-v0.17.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "73c617d173de0cb9c872dbb5922ed871b83ac4992fd7a90f039b7212e079e18d"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.17.0/nucleate-v0.17.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "dd6fcf5f0d8a9d6a29ed70d84f647ba2a0f69a3e8584ca9594e3b196e41e01f5"
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
