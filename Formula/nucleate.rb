# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.15.1"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.15.1/nucleate-v0.15.1-aarch64-apple-darwin.tar.gz"
      sha256 "931bbfe5879f68c3941acd3fc2d37da6c0052d887a6184ac76c153266e21cc8d"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.15.1/nucleate-v0.15.1-x86_64-apple-darwin.tar.gz"
      sha256 "9b863358b0c5fadbcec565c8ef2cbd4d620992dd9f4e394c7730d4aeffe3216f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.15.1/nucleate-v0.15.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7ed85f9b401c575bd8d2f9ff691d9f8873496a4661eab14248d7561badae0857"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.15.1/nucleate-v0.15.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "95645d77f19c024382c97d4f4ec64076f0fd07ffb831c04c22e48596b2c01ef4"
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
