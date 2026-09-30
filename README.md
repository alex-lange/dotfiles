# dotfiles

Public dotfiles and macOS app settings.

## Setup

See [`NEW_COMPUTER_SETUP.md`](NEW_COMPUTER_SETUP.md) for the new-computer checklist. The
shell files are intended to be symlinked into the home directory.

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
| `zshrc`, `zsh_profile`, `zshenv`, `aliases` | Shell configuration |
| `gitconfig` | Git aliases and defaults |
| `RectangleConfig.json` | Rectangle window manager |
| `agents/` | Shared coding-agent instructions |
| `editors/` | VS Code user settings |
| `apps/` | Exported Obsidian settings |
| `NEW_COMPUTER_SETUP.md` | New-computer setup checklist |
