# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.7.2"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.7.2/nucleate-v0.7.2-aarch64-apple-darwin.tar.gz"
      sha256 "f0d1e91486c8773a2f2a997d5efc0df622b4bed63e2dfaa4c9cfeeb4fc21cffa"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.7.2/nucleate-v0.7.2-x86_64-apple-darwin.tar.gz"
      sha256 "ebe1cf9af3422ef5334df6198269d01897762ad86776766eb85c77c478c46e6a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.7.2/nucleate-v0.7.2-aarch64-unknown-linux-musl.tar.gz"
      sha256 "dd8fba2de185684d5ba2dc1bebfe829bb88c86b44c6180eda2f81e37060513dd"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.7.2/nucleate-v0.7.2-x86_64-unknown-linux-musl.tar.gz"
      sha256 "35309da8d3ddb9d0ca9517bce425f913c000cc0e79c66859fd0895075bb57d7d"
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
