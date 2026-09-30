# dotfiles

Public dotfiles and macOS app settings.

## Setup

See [`SETUP.md`](SETUP.md) for the new-machine steps. The shell files are intended to be
symlinked into the home directory.

Private and machine-specific shell settings belong in `~/.zshrc.local`. That file stays
outside this repository.

## Agent instructions

`agents/AGENTS.md` contains tool-neutral instructions and imports the writing rules in
the same directory.

GitHub Copilot CLI can load them as user-level instructions from
`~/.copilot/copilot-instructions.md`. Other coding agents can use the same files through
their supported instruction filename or directory.

## Layout

| Path | What |
|---|---|
| `zshrc`, `zsh_profile`, `zshenv`, `profile`, `aliases` | Shell configuration |
| `gitconfig` | Git aliases and defaults |
| `.emacs` | Emacs |
| `RectangleConfig.json` | Rectangle window manager |
| `agents/` | Shared coding-agent instructions |
| `editors/` | VS Code, Cursor, and Windsurf user settings |
| `apps/` | Exported settings for iTerm2, Rectangle, Bumpr, and Obsidian |
| `SETUP.md` | New-machine setup |
| `SOURCES.md` | Public repos to re-clone rather than copy |
