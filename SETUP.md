# Mac setup

## Install the configs

Clone the repository, then symlink the files you want to use:

```sh
git clone https://github.com/alex-lange/dotfiles.git "$HOME/configs"

ln -s "$HOME/configs/zshrc" "$HOME/.zshrc"
ln -s "$HOME/configs/zshenv" "$HOME/.zshenv"
ln -s "$HOME/configs/profile" "$HOME/.profile"
```

Include the shared Git settings, then set the identity for the machine:

```sh
git config --global --add include.path "$HOME/configs/gitconfig"
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Put machine-specific or private shell configuration in `~/.zshrc.local`. The tracked
`zshrc` loads it when present.

## Command-line tools

Install [Homebrew](https://brew.sh/), then install the tools used by the shell config:

```sh
brew install direnv mise ripgrep
```

`mise` manages language runtimes. This avoids loading several Node version managers in
the same shell.

## App settings

- Import `RectangleConfig.json` from Rectangle.
- Import `apps/com.googlecode.iterm2.plist` from iTerm2.
- Copy the files in `editors/` into the matching editor's user settings.
- Copy the files in `claude/` to `~/.claude/`. Keep the writing-style files next to
  `CLAUDE.md`, and keep the hook at `~/.claude/hooks/block-sed-n.py`.
- Restore Obsidian settings from `apps/` after the vault has synced.

## macOS settings

Show filename extensions in Finder. In Keyboard Shortcuts, map Caps Lock to Control if
desired.

These commands reduce the key-repeat delay:

```sh
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
```
