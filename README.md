# dotfiles

My personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Structure

Each top-level directory is a **stow package** — its contents mirror the structure of `$HOME`. Stow creates symlinks from your home directory into the package, so the real files live here while tools find them at their expected paths.

```
dotfiles/
├── tmux/
│   ├── .config/
│   │   └── tmux/
│   │       └── tmux.conf       → ~/.config/tmux/tmux.conf
│   └── .local/
│       └── bin/
│           ├── tdl             → ~/.local/bin/tdl
│           ├── tds             → ~/.local/bin/tds
│           ├── tdlm            → ~/.local/bin/tdlm
│           └── tsl             → ~/.local/bin/tsl
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
| `tmux`  | tmux config (`~/.config/tmux/tmux.conf`) and layout scripts (`~/.local/bin/`) |

### tmux layout commands

Source: adapted from [Omarchy hotkeys](https://learn.omacom.io/2/the-omarchy-manual/53/hotkeys#tmux-layout-functions). Must be run inside a tmux session.

| Command | Usage | Description |
|---------|-------|-------------|
| `tdl` | `tdl <ai> [<ai2>]` | Dev layout: editor (nvim) left, AI pane(s) right, terminal strip at bottom |
| `tds` | `tds` | Square layout: nvim, diff watch (`hunk diff --watch`), terminal, opencode |
| `tdlm` | `tdlm <ai> [<ai2>]` | Runs `tdl` in one window per subdirectory of the current directory |
| `tsl` | `tsl <count> <cmd>` | Opens N tiled panes all running the same command (useful for AI swarms) |

`<ai>` and `<ai2>` are any CLI command to launch in the AI pane(s), e.g. `claude`, `opencode`, `gemini`, `mods`.
