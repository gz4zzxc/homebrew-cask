# Repository Guidelines

This is a personal Homebrew Cask tap.

## Project Structure & Module Organization

- `Casks/` Ruby cask definitions (one cask per file, e.g., `Casks/futu-niuniu.rb`).
- `.github/workflows/` GitHub Actions that auto‑update and validate selected casks.
- `README.md` User instructions and a version table that must stay in sync with casks.

## Build, Test, and Development Commands

Homebrew 6+ requires non-official taps to be trusted before their Ruby is evaluated.
See [Tap Trust](https://docs.brew.sh/Tap-Trust).

```bash
# Tap + trust (whole tap; fine for a self-owned personal tap)
brew tap gz4zzxc/homebrew-cask
brew trust gz4zzxc/cask

# Prefer fully-qualified names for style/audit (path args are unreliable)
brew style gz4zzxc/cask/<token>
brew audit --cask --strict gz4zzxc/cask/<token>
brew livecheck --cask gz4zzxc/cask/<token>

# Install / uninstall
brew install --cask gz4zzxc/cask/<token>
brew uninstall --cask <token>
```

Installing a fully-qualified cask also trusts that single item:
`brew install --cask gz4zzxc/cask/<token>`.

## Coding Style & Naming Conventions

- Ruby, 2‑space indentation; keep lines concise and readable.
- File name = cask token; lowercase, hyphen‑separated (e.g., `longbridge-pro.rb`).
- Follow the official [Cask Cookbook stanza order](https://docs.brew.sh/Cask-Cookbook#stanza-order)
  (blank lines between groups matter):

  ```
  arch
  os

  version
  sha256

  url
  name
  desc
  homepage

  livecheck

  auto_updates
  conflicts_with
  depends_on

  app / pkg / ...
  uninstall   # required with pkg/installer
  zap
  caveats
  ```

- **Required stanzas** (Cookbook): `version`, `sha256`, `url`, `name`, `desc`,
  `homepage`, `livecheck`, `depends_on`, `zap`, plus at least one artifact
  (`app` / `pkg` / …).
- `livecheck` is mandatory. `no_autobump!` is for the official Homebrew
  autobump pipeline only and must not be used in this third-party tap.
- Use `arch` and per‑arch `sha256` when binaries differ; avoid `:latest`
  unless truly necessary.
- `desc`: short, factual English (< 80 chars), start with an uppercase letter;
  no app name, vendor, platform, or marketing fluff. Put Chinese / alternate
  names in extra `name` stanzas (Latin-alphabet `name` first).
- Prefer vendor HTTPS URLs. Add `verified:` only when the URL domain differs
  from the homepage domain (e.g. `cdn.example.net` vs `example.com`).
  Same-organisation subdomains and `github.com` URLs do not need `verified:`.

## Testing Guidelines

- Run both `brew style` and `brew audit --cask --strict` on modified casks
  (fully-qualified names; tap must be trusted).
- Prefer an end‑to‑end install/uninstall locally; verify the app starts and
  `zap` paths are accurate.
- From Homebrew 5+, unsigned / Gatekeeper-failing casks are discouraged
  (official homebrew-cask will disable them around Sep 2026). Prefer
  codesigned upstream artifacts. Do not rely on `--no-quarantine`
  (deprecated).

## Commit & Pull Request Guidelines

- One cask per PR. Update `README.md`’s version table alongside cask changes.
- Commit message format:
  - Add: `cask <token>: add <version>`
  - Update: `cask <token>: update to <version>`
  - Remove: `cask <token>: remove`
- PR description: link upstream release, include checksum method, and paste
  `brew audit` / `brew style` output when possible.

## Automation & CI

- Workflows in `.github/workflows/` auto‑bump specific casks and run
  validations (`ruby -c`, `brew trust`, `brew style`, `brew audit --strict`).
- After manual bumps, ensure workflows still pass. You can manually trigger
  runs from GitHub Actions.
