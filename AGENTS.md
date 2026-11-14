# Repository Guidelines

Personal Homebrew Cask tap. Casks live in `Casks/`; usage and the version table are in `README.md`.

## Cask changes

- Follow the [Cask Cookbook](https://docs.brew.sh/Cask-Cookbook) for Ruby style, stanza order, descriptions, and artifacts.
- This tap requires `livecheck`, `depends_on`, and `zap` in addition to the standard metadata and artifacts. Use `uninstall` with `pkg`/installer artifacts.
- Prefer versioned vendor HTTPS downloads; use per-architecture checksums when binaries differ. Prefer signed artifacts; do not rely on `--no-quarantine`.
- Do not use `no_autobump!` (official pipeline only) or deprecated `verified:`.
- Keep the README version table in sync with cask changes. Preserve its token and version columns: `.github/actions/commit-update/action.yml` updates them automatically.
- For update automation, use the relevant `.github/workflows/update-*.yml` and shared actions in `.github/actions/`.

## Validation

For modified casks, run style and strict audit using fully-qualified names; file paths are unreliable:

```bash
brew style gz4zzxc/cask/<token>
brew audit --cask --strict gz4zzxc/cask/<token>
```

The tap must be added and trusted first; see [README.md](README.md#使用). Use `brew livecheck --cask gz4zzxc/cask/<token>` when changing version detection. Verify installation, launch, uninstall, and `zap` paths when the change affects those behaviors. Documentation-only changes need no cask checks.

## Commits and PRs

- One cask per PR. Link the upstream release, explain checksum verification, and include validation results.
- Commit subjects: `cask <token>: add <version>`, `cask <token>: update to <version>`, or `cask <token>: remove`.
