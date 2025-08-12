# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal Homebrew Cask Tap repository containing custom casks for macOS applications not available in the official Homebrew repository. The repository includes automated GitHub Actions workflows that check for and apply updates to cask versions daily.

## Codebase Structure

- `Casks/` - Contains Homebrew cask definition files (.rb) for each application
- `.github/workflows/` - GitHub Actions workflows for automated version updates
- `README.md` - Main documentation with installation instructions and application list
- `CONTRIBUTING.md` - Development guidelines and update procedures

## Common Development Tasks

### Testing Casks
```bash
# Check Ruby syntax
ruby -c Casks/{app-name}.rb

# Run Homebrew audit
brew audit --cask Casks/{app-name}.rb

# Run Homebrew style check
brew style Casks/{app-name}.rb
```

### Manual Version Updates
1. Update the `version` field in the cask file
2. Download the new version to calculate SHA256 checksums
3. Update SHA256 values in the cask file
4. Update the version in README.md table
5. Test with `brew audit` and `brew style`

### Adding New Applications
1. Create a new cask file in `Casks/` directory
2. Create a corresponding GitHub Actions workflow in `.github/workflows/`
3. Add the application to the README.md table
4. Follow the commit message conventions in CONTRIBUTING.md

## Architecture Notes

Casks follow the Homebrew Cask format with:
- Version and SHA256 checksums for integrity verification
- Architecture-specific downloads when needed (ARM64/Intel)
- Livecheck configurations for automated version detection
- Post-installation configurations to prevent first-run tutorials
- Proper uninstall and zap directives for clean removal

The GitHub Actions workflows automatically:
1. Check for new versions daily
2. Download new versions to calculate SHA256 checksums
3. Update cask files and README.md with new versions
4. Commit and push changes with standardized commit messages