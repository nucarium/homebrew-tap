# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.7.1"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.7.1/nucleate-v0.7.1-aarch64-apple-darwin.tar.gz"
      sha256 "7c9f838236a3fe3377b6f0bdeb6354bb3ce81041c00bf331815de1503d2c025d"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.7.1/nucleate-v0.7.1-x86_64-apple-darwin.tar.gz"
      sha256 "509c226bface346e39aee95259cfa193fdde6c998226e49ed32e87e0a8ffb6f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.7.1/nucleate-v0.7.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0386eb506aeb3dcb41b47bea87f1f4000158c6502d9ef6473f48c29590f90fa7"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.7.1/nucleate-v0.7.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "33ef93cc514ec8ccf042bb1f5007829691898576cceb8de90ef9daa5dd418c6e"
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
