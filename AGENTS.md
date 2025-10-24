# Repository Guidelines

This is a personal Homebrew Cask tap. Contributions are rare but welcome when aligned with the repository’s scope and automation.

## Project Structure & Module Organization

- `Casks/` Ruby cask definitions (one cask per file, e.g., `Casks/futu-niuniu.rb`).
- `.github/workflows/` GitHub Actions that auto‑update and validate selected casks.
- `README.md` User instructions and a version table that must stay in sync with casks.

## Build, Test, and Development Commands

- Tap locally: `brew tap gz4zzxc/homebrew-cask`
- Style check: `brew style Casks/<token>.rb` (Rubocop via Homebrew)
- Audit checks: `brew audit --cask --strict Casks/<token>.rb`
- Livecheck: `brew livecheck --cask <token>`
- Install/uninstall test: `brew install --cask <token>` / `brew uninstall --cask <token>`

## Coding Style & Naming Conventions

- Ruby, 2‑space indentation; keep lines concise and readable.
- File name = cask token; lowercase, hyphen‑separated (e.g., `longbridge-pro.rb`).
- Recommended stanza order: `version`, `sha256`, `url` (+ `verified:`/`user_agent:` as needed), `name`, `desc`, `homepage`, `livecheck`, `auto_updates`, `depends_on`, artifact(s) (`app`/`pkg`), `zap`, `caveats`.
- Use `arch` and per‑arch `sha256` when binaries differ; avoid `:latest` unless truly necessary.
- Keep `desc` short and factual; include localized `name` when helpful.

## Testing Guidelines

- Run both: `brew style` and `brew audit --strict` on modified casks.
- Perform an end‑to‑end install/uninstall locally; verify the app starts and `zap` paths are accurate.
- Prefer vendor, HTTPS, and stable URLs; always supply `verified:` for GitHub/CDN sources.

## Commit & Pull Request Guidelines

- One cask per PR. Update `README.md`’s version table alongside cask changes.
- Commit message format:
  - Add: `cask <token>: add <version>`
  - Update: `cask <token>: update to <version>`
  - Remove: `cask <token>: remove`
- PR description: link upstream release, include checksum method, and paste `brew audit/style` output when possible.

## Automation & CI

- Workflows in `.github/workflows/` auto‑bump specific casks and run validations. After manual bumps, ensure workflows still pass. You can manually trigger runs from GitHub Actions.
