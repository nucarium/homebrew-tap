# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.2.0/nucleate-v0.2.0-aarch64-apple-darwin.tar.gz"
      sha256 "311e8e3856da13e6a073ba12443dccfcc8c86476420cfe8edb57e35d731def86"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.2.0/nucleate-v0.2.0-x86_64-apple-darwin.tar.gz"
      sha256 "a1daf4ddf83d794a3efe5b4479b598845886dea24fb404bd23a5c835ea13e1f4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.2.0/nucleate-v0.2.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "e5dbde4a53598b0b9915059fcc78d3408b8bc669aa33f5cf9dcb636ba1df6879"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.2.0/nucleate-v0.2.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "e01ab3a769afccecc0fea27e4bd6c5ff10dcc473741ab69165accccc49f6b2b5"
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
