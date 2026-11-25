# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.13.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.13.0/nucleate-v0.13.0-aarch64-apple-darwin.tar.gz"
      sha256 "e2ab76d8ba11c8f66bec06fae76f201305657bd9530f8bafadaaf7a5e5c035e8"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.13.0/nucleate-v0.13.0-x86_64-apple-darwin.tar.gz"
      sha256 "20d8fc45faaafb388ee65f5a634773a74faa20174bb2526cb4a75f4c5f7fd1ae"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.13.0/nucleate-v0.13.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c5608ccbb565e5081dde443bad75470659967287d73804dcb139c9c2dd86a11d"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.13.0/nucleate-v0.13.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "ac3793a2feb2819b111206d58a9cf44f81b2ad66c8dc09c090a1eadc112e8e78"
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
