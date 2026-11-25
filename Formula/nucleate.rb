# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.12.1"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.12.1/nucleate-v0.12.1-aarch64-apple-darwin.tar.gz"
      sha256 "8c6ba337fe575560c9400523e8f642ab039ed5cabdb7f0a034153495fd51e61e"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.12.1/nucleate-v0.12.1-x86_64-apple-darwin.tar.gz"
      sha256 "47edec5c76e588301f1ced0e7e6ee88711c8755c806333d0876894284494e5cb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.12.1/nucleate-v0.12.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e118a4d030f7042b19cf9765deae188afc19cf161c35320868b87246bd4b7690"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.12.1/nucleate-v0.12.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4ff1cfc98bcb2bb9e22fe7f6bab071e22baf4fad670811eaa613440e502480a2"
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
