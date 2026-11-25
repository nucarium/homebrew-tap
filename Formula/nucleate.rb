# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.12.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.12.0/nucleate-v0.12.0-aarch64-apple-darwin.tar.gz"
      sha256 "80d5c9392142848f408c7f093f3b59f3c36a8468b4e7dbcc3d22facf20d18796"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.12.0/nucleate-v0.12.0-x86_64-apple-darwin.tar.gz"
      sha256 "5a3a5863d3f29d784507f51444dcb08ca6130545cdb1bfd351c7b06fc5b8f6eb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.12.0/nucleate-v0.12.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "63ed622957167a713fc0332db100f3c376f8da07e6e19cc78988e156b859a8c1"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.12.0/nucleate-v0.12.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "7114e8c5fc700995e49be04793b915ab81ef6ed3527c03b3be73b1cbec3e48f0"
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
