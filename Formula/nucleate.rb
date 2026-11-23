# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.7.0"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.7.0/nucleate-v0.7.0-aarch64-apple-darwin.tar.gz"
      sha256 "4d28b1c789a4b7f00ae4f4e90da14bcf034fdb343a639f0fef1663a9d7a3cf84"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.7.0/nucleate-v0.7.0-x86_64-apple-darwin.tar.gz"
      sha256 "9150f555b50dc2d699ade3eb61fdef20d1ad9905e8e58f415e6fdd23a93c3980"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.7.0/nucleate-v0.7.0-aarch64-unknown-linux-musl.tar.gz"
      sha256 "701ec3ee6b936ebf09b4687fa2ede26afd92275bbcddbce06b368654bf509763"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.7.0/nucleate-v0.7.0-x86_64-unknown-linux-musl.tar.gz"
      sha256 "fb47a910f46db04f85845871a4cf660bf7d957cb12584689f926541fbd41ab7c"
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
