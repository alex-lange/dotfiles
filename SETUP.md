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
- Restore Obsidian settings from `apps/` after the vault has synced.

## Coding-agent instructions

`AGENTS.md` and the files in `agents/` are not tied to one coding agent. Keep their
relative paths unchanged because `AGENTS.md` imports the writing-style files.

For GitHub Copilot CLI, symlink them into its user instruction directory:

```sh
mkdir -p "$HOME/.copilot"
ln -s "$HOME/configs/AGENTS.md" \
  "$HOME/.copilot/copilot-instructions.md"
ln -s "$HOME/configs/agents" "$HOME/.copilot/agents"
```

Copilot also recognizes `AGENTS.md` in a repository root. Run `/init` in Copilot CLI to
create repository-specific instructions when a project needs more than the shared
writing rules.

## macOS settings

Show filename extensions in Finder. In Keyboard Shortcuts, map Caps Lock to Control if
desired.

These commands reduce the key-repeat delay:

```sh
defaults write -g InitialKeyRepeat -int 10
defaults write -g KeyRepeat -int 1
```
