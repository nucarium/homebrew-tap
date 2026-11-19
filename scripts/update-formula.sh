#!/bin/sh
# Writes Formula/nucleate.rb for one release of nucleate.
#
#   scripts/update-formula.sh 0.1.1
#
# It reads the four checksums published beside the release's archives in
# github.com/nucarium/nucarium-cli and writes the formula from them. Nothing
# else is edited by hand: to change the formula, change this script.
#
# The checksums are fetched with `gh` when it is signed in (which also works
# while the repository is private), and with `curl` otherwise.
set -eu

repo=nucarium/nucarium-cli
version=${1:-}
case $version in
  '' | *[!0-9.]* | .* | *. | *..*)
    echo "usage: scripts/update-formula.sh <version>, for example 0.1.1" >&2
    exit 2
    ;;
esac
tag=v$version
root=$(CDPATH='' cd -- "$(dirname -- "$0")/.." && pwd)
out=$root/Formula/nucleate.rb

archive() { printf 'nucleate-%s-%s.tar.gz' "$tag" "$1"; }
url() { printf 'https://github.com/%s/releases/download/%s/%s' "$repo" "$tag" "$(archive "$1")"; }

# Prints the SHA-256 published for one target's archive.
checksum() {
  file=$(archive "$1").sha256
  if [ -n "${NUCLEATE_CHECKSUM_DIR:-}" ]; then
    line=$(cat "$NUCLEATE_CHECKSUM_DIR/$file")
  elif command -v gh >/dev/null 2>&1 && gh auth status >/dev/null 2>&1; then
    line=$(gh release download "$tag" --repo "$repo" --pattern "$file" --output -)
  else
    line=$(curl -fsSL "$(url "$1").sha256")
  fi
  sum=${line%% *}
  case $sum in
    *[!0-9a-f]* | '') echo "no checksum for $file" >&2; exit 1 ;;
  esac
  [ ${#sum} -eq 64 ] || { echo "not a SHA-256 for $file: $sum" >&2; exit 1; }
  printf '%s' "$sum"
}

mac_arm=$(checksum aarch64-apple-darwin)
mac_intel=$(checksum x86_64-apple-darwin)
linux_arm=$(checksum aarch64-unknown-linux-musl)
linux_intel=$(checksum x86_64-unknown-linux-musl)

mkdir -p "$root/Formula"
cat >"$out" <<FORMULA
# typed: false
# frozen_string_literal: true

# Written by scripts/update-formula.sh. Change the script, not this file.
class Nucleate < Formula
  desc "Multi-repo session workspaces for coding agents"
  homepage "https://nucarium.dev"
  version "$version"
  license any_of: ["MIT", "Apache-2.0"]

  uses_from_macos "git"

  on_macos do
    on_arm do
      url "$(url aarch64-apple-darwin)"
      sha256 "$mac_arm"
    end
    on_intel do
      url "$(url x86_64-apple-darwin)"
      sha256 "$mac_intel"
    end
  end

  on_linux do
    on_arm do
      url "$(url aarch64-unknown-linux-musl)"
      sha256 "$linux_arm"
    end
    on_intel do
      url "$(url x86_64-unknown-linux-musl)"
      sha256 "$linux_intel"
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
FORMULA
echo "wrote Formula/nucleate.rb for nucleate $version"
