# Nucarium Homebrew tap

Installs `nucleate`, the workspace CLI for coding-agent sessions, and
`nucleated`, the box daemon, on a Mac or on Linux with
[Homebrew](https://brew.sh).

```bash
brew install nucarium/tap/nucleate
```

That taps this repository and installs both binaries from the release
archives published by
[nucarium-cli](https://github.com/nucarium/nucarium-cli). They need `git`,
which macOS already has.

```bash
nucleate --version
```

To upgrade later:

```bash
brew upgrade nucleate
```

On a Mac this is for trying `nucleate` locally. A box is built with the
[box recipe](https://nucarium.dev/box), which installs the same release for
Linux.

## What is here

| Path | What it is |
|---|---|
| `Formula/nucleate.rb` | The formula. It is written by the script; do not edit it by hand |
| `scripts/update-formula.sh` | Writes the formula for one release of `nucleate` |
| `.github/workflows/update.yml` | Rewrites the formula when `nucarium-cli` publishes a release |
| `.github/workflows/build.yml` | Lints the script and the formula; installs for real when run by hand |

The formula installs prebuilt binaries: `aarch64-apple-darwin` and
`x86_64-apple-darwin` on macOS, and the static `aarch64-unknown-linux-musl`
and `x86_64-unknown-linux-musl` builds on Linux.

## After a release of nucleate

Nothing to do. When `nucarium-cli` publishes a release, its Binaries workflow
builds the four archives, attaches them to the release, and then tells this
repository the version and the four checksums. The **Update formula**
workflow here rewrites `Formula/nucleate.rb` from them, checks its style, and
commits it as `feat: nucleate <version>`. `brew upgrade nucleate` picks it up
from there.

For that message to arrive, the Robot App that `nucarium-cli` releases with
must be installed on this repository as well.

To do the same by hand, signed in to `gh`:

```bash
scripts/update-formula.sh <version>
```

```bash
brew style Formula/nucleate.rb
```

To prove a real install on macOS and Linux, run the **Build** workflow by
hand from the Actions tab. That step downloads the release archives, so it
passes only while `nucarium-cli` and its releases are public.

## Commits

Conventional Commits, signed.

## Licence

Licensed under either of the [Apache License, Version 2.0](LICENSE-APACHE) or
the [MIT licence](LICENSE-MIT), at your option. Copyright Mataki Labs LLC.
