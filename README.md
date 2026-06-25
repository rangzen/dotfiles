# dotfiles

My personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each top-level directory is a **stow package** — its contents mirror the structure of `$HOME`. Stow creates symlinks from your home directory into the package, so the real files live here while tools find them at their expected paths.

```
dotfiles/
├── tmux/
│   └── .config/
│       └── tmux/
│           └── tmux.conf   → ~/.config/tmux/tmux.conf
└── ...
```

## Requirements

```bash
# Debian/Ubuntu
sudo apt install stow

# macOS
brew install stow
```

## Usage

Clone the repo next to your home directory or anywhere you like, then `cd` into it and run `stow <package>`:

```bash
git clone git@github.com:rangzen/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Install a single package
stow tmux

# Install all packages at once
stow */

# Remove a package (delete its symlinks)
stow -D tmux

# Dry-run to preview what would happen
stow -n tmux
```

Stow defaults to symlinking into the parent of the current directory (`$HOME` when you're in `~/.dotfiles`). If you clone elsewhere, pass the target explicitly:

```bash
stow --target="$HOME" tmux
```

## Packages

| Package | Description |
|---------|-------------|
| `tmux`  | tmux config (`~/.config/tmux/tmux.conf`) |
