# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.10.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.10.0/nucleate-v0.10.0-aarch64-apple-darwin.tar.gz"
      sha256 "f0826c503450a263aa9dc3d2dda2d0283f52dc37e4835abc031cc5484efe1d40"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.10.0/nucleate-v0.10.0-x86_64-apple-darwin.tar.gz"
      sha256 "cf578f60e103e3858a7e2bdb0bc33f858319c7225b52567818e28eeb182650bd"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.10.0/nucleate-v0.10.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "ac9c16fe7a80f9b5a5324841e17b5e7ec203dde2f5dc9f8fa5bb60473157d1e4"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.10.0/nucleate-v0.10.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "645d7fedb2b09441b7a815253c03feff19636eb10e6a0dcd5bb072a9acc48969"
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
