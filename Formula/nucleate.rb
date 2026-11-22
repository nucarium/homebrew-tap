# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.5.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.5.0/nucleate-v0.5.0-aarch64-apple-darwin.tar.gz"
      sha256 "ddb49ac0a010f8dfaff04a5162ccb4200f12b12207af277ffda9e35b4ac1bef4"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.5.0/nucleate-v0.5.0-x86_64-apple-darwin.tar.gz"
      sha256 "13a2777ecdf9d43d8365dade32213c31fa62ab6476ac7260a1f0889e2ea6ba90"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.5.0/nucleate-v0.5.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "41e1638e5b87544940b7e2e9ec6245374d8e5b7da3c4f32457f2cf1b572730de"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.5.0/nucleate-v0.5.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "bf0c596275a49b4b7276d0bbad1e0a03d9d44f649da55ee1029126211e2a003e"
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
