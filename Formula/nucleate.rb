# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.3.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.3.0/nucleate-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "e25b3f143ded235d34d2c9194acf4f1a35b2d12944abd6c7e575ed2ccb12be60"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.3.0/nucleate-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "19fc0adcca4c2a05d7d6b10a76cd89922e388104f3042949f471b188f950f3f8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.3.0/nucleate-v0.3.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "1d240a87370ad357fe0c6ffb0ecc9fdb6a7acc731a128f98cbc41dc034f941b8"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.3.0/nucleate-v0.3.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "596104c4b62226716fd5ef6156b3ba31d3845b1b35c3de1fa03126be56de1fcf"
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
