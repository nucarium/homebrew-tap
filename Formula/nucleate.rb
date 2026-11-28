# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "0.17.1"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.17.1/nucleate-v0.17.1-aarch64-apple-darwin.tar.gz"
      sha256 "affd684bb386e93558c8cf9765bbf62cf4446dbeabff8d6efa1411eef8bacc0e"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.17.1/nucleate-v0.17.1-x86_64-apple-darwin.tar.gz"
      sha256 "5b47fdf21b90f424002903fa40697e1404117f420bf73593ca34036d433b7818"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.17.1/nucleate-v0.17.1-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0c7bdc6752705baf1364823a96d251507ae20d81927f8c94374655c546d1450e"
    end
    on_intel do
      url "https://github.com/nucarium/nucarium-cli/releases/download/v0.17.1/nucleate-v0.17.1-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c3c8ad3bf06021110b6addd7b8411bbc0347363d9d2d53b28e6f8a01e9cc9403"
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
