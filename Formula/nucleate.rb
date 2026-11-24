# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.8.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.8.0/nucleate-v0.8.0-aarch64-apple-darwin.tar.gz"
      sha256 "66cf5e7e3540bb5c1e24594f7b8dcfe6f1141165b552344faa21d33968e3676c"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.8.0/nucleate-v0.8.0-x86_64-apple-darwin.tar.gz"
      sha256 "8ba50af323098a62d451da44be652f1b1d38f6bf032e5350df2455ab421eb952"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.8.0/nucleate-v0.8.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "27d8382b786da7b53e8b652c87d1514059cf431dfcf9dbf6f707a82eceb59c80"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.8.0/nucleate-v0.8.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8af58aa27d76b2219760052898010aef4d3f16205513b9e3f48173d488d7e201"
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
