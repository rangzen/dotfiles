# dotfiles

My personal dotfiles, managed with [GNU Stow](https://www.gnu.org/software/stow/).

Each top-level directory is a stow package whose contents mirror `$HOME`. Stow creates symlinks so the real files live here while tools find them at their expected paths.

## Requirements

```bash
# Debian/Ubuntu
sudo apt install stow

# macOS
brew install stow
```

## Usage

```bash
git clone https://github.com/rangzen/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

stow tmux        # install a package
stow */          # install all packages
stow -D tmux     # remove a package
stow -n tmux     # dry-run
```

If you clone elsewhere: `stow --target="$HOME" tmux`

## WezTerm

- Starts maximized on the active screen
- No decorations, no tab bar, no padding
- Launches tmux directly on startup

## Whispypy

- Audio input: ALSA HDA DSP device
- Keyboard layout: French BEPO

## Hammerspoon

- `F13` - interactive screenshot saved to `~/Pictures/` and copied to clipboard

## markdownlint

Rules for `markdownlint-cli2` (`~/.markdownlint-cli2.yaml`). Used by the `nvim` package via `nvim-lint`.

## Neovim

- `lint.lua` - `nvim-lint` with `markdownlint-cli2`, uses the `markdownlint` package config

## tmux

Inspired by [Omarchy](https://omarchy.org/).

- Prefix: `Ctrl+Space`
- Default shell: Fish
- Pane split: `prefix+v` (vertical) / `prefix+h` (horizontal)
- Pane navigation: `Shift+Alt+Arrows`
- Pane resize: `Ctrl+Alt+Arrows`
- Window switch: `Alt+Left/Right` or `Alt+<BEPO digit keys>` for windows 1-9
- Session switch: `Alt+Up/Down`
- Copy mode: vi-style (`v` to select, `y` to copy)
- Reload config: `prefix+q`

### Layout scripts

Must be run inside a tmux session. `<ai>` is any CLI command e.g. `claude`, `opencode`, `gemini`.

| Command | Meaning | Usage |
|---------|---------|-------|
| `tdl`  | Tmux Dev Layout | `tdl <ai> [<ai2>]` - editor left, AI pane(s) right, terminal strip at bottom |
| `tdlm` | Tmux Dev Layout Multi | `tdlm <ai> [<ai2>]` - runs `tdl` in one window per subdirectory |
| `tds`  | Tmux Dev Square | `tds` - square 4-pane layout: nvim, diff watch, terminal, opencode |
| `tsl`  | Tmux Split Launch | `tsl <count> <cmd>` - N tiled panes all running the same command |
