# configs

Public dotfiles and macOS app settings.

## Setup

See [`SETUP.md`](SETUP.md) for the new-machine steps. The shell files are intended to be
symlinked into the home directory.

Private and machine-specific shell settings belong in `~/.zshrc.local`. That file stays
outside this repository.

## Layout

| Path | What |
|---|---|
| `zshrc`, `zsh_profile`, `zshenv`, `profile`, `aliases` | Shell configuration |
| `gitconfig` | Git aliases and defaults |
| `.emacs` | Emacs |
| `RectangleConfig.json` | Rectangle window manager |
| `claude/` | Claude Code instructions, settings, and hook |
| `editors/` | VS Code, Cursor, and Windsurf user settings |
| `apps/` | Exported settings for iTerm2, Rectangle, Bumpr, and Obsidian |
| `SETUP.md` | New-machine setup |
| `SOURCES.md` | Public repos to re-clone rather than copy |
