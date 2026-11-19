# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.4.3"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.4.3/nucleate-v0.4.3-aarch64-apple-darwin.tar.gz"
      sha256 "bb085a120915629117f5d65165be1fb80fbb3afc3c44411fb570d4ad77776a3b"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.4.3/nucleate-v0.4.3-x86_64-apple-darwin.tar.gz"
      sha256 "ada17c421858aaf906c2965ed87a4e9d801ea175a3525dfa2dcf75f53e03f967"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.4.3/nucleate-v0.4.3-aarch64-unknown-linux-musl.tar.gz"
      sha256 "7f983de2607ef6954000aa2a8a3bcbc1c9411b363af2404f8e74d13191e5c547"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.4.3/nucleate-v0.4.3-x86_64-unknown-linux-musl.tar.gz"
      sha256 "29b49705e3108c9bbbb87a7d00b4852b1d410c3f65899c1dbd26b2a47fc20623"
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
