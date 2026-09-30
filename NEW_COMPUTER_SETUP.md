# New computer setup

## Install apps

- iTerm2
- Rectangle
- Visual Studio Code
- Firefox
- Obsidian

Install [Homebrew](https://brew.sh/):

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Install the dotfiles

Clone the repository, then symlink the shell files:

```sh
git clone https://github.com/alex-lange/dotfiles.git "$HOME/dotfiles"

ln -s "$HOME/dotfiles/zshrc" "$HOME/.zshrc"
ln -s "$HOME/dotfiles/zshenv" "$HOME/.zshenv"
```

Include the shared Git settings, then set the identity for the machine:

```sh
git config --global --add include.path "$HOME/dotfiles/gitconfig"
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Put machine-specific or private shell configuration in `~/.zshrc.local`. The tracked
`zshrc` loads it when present.

Install the command-line tools used by the shell config:

```sh
brew install direnv mise ripgrep
```

`mise` manages language runtimes. This avoids loading several Node version managers in
the same shell.

## Configure apps

### iTerm2

- Add key bindings for the next and previous pane.
- Disable dimming for inactive split panes.
- Select the Solarized Dark color preset.
- Enable unlimited scrollback.

### Firefox

Sign in to Firefox Sync to restore extensions and browser settings.

### Visual Studio Code

- Sign in to Settings Sync.
- Run `Shell Command: Install 'code' command in PATH` from the command palette.
- Copy `editors/vscode-settings.json` into the VS Code user settings.

### Rectangle and Obsidian

- Import `RectangleConfig.json` from Rectangle.
- Restore Obsidian settings from `apps/` after the vault has synced.

## Coding-agent instructions

The files in `agents/` are not tied to one coding agent. Keep them together because
`AGENTS.md` imports the writing-style files by relative path.

For GitHub Copilot CLI, symlink them into its user instruction directory:

```sh
mkdir -p "$HOME/.copilot"
ln -s "$HOME/dotfiles/agents/AGENTS.md" \
  "$HOME/.copilot/copilot-instructions.md"
ln -s "$HOME/dotfiles/agents/writing-style.md" \
  "$HOME/.copilot/writing-style.md"
ln -s "$HOME/dotfiles/agents/writing-style-technical.md" \
  "$HOME/.copilot/writing-style-technical.md"
ln -s "$HOME/dotfiles/agents/writing-style-conversation.md" \
  "$HOME/.copilot/writing-style-conversation.md"
ln -s "$HOME/dotfiles/agents/engineering-workflow.md" \
  "$HOME/.copilot/engineering-workflow.md"
```

Copilot also recognizes `AGENTS.md` in a repository root. Run `/init` in Copilot CLI to
create repository-specific instructions when a project needs more than the shared
writing rules.

## Configure macOS

- Finder: show all filename extensions.
- Desktop & Dock: reduce the Dock size and enable automatic hiding.
- Mission Control: disable automatic Space reordering and application-based Space
  switching.
- Touch ID & Password: add a fingerprint.
- Keyboard Shortcuts: map Caps Lock to Control.
- Control Center: show Bluetooth and Sound in the menu bar.
- Trackpad: disable Smart Zoom.

These commands reduce the key-repeat delay:

```sh
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
```
