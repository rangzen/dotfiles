# dotfiles

My personal dotfiles, managed with [chezmoi](https://www.chezmoi.io/).

This repository is a chezmoi source directory. Files use chezmoi's naming conventions (`dot_`, `executable_`, and `.tmpl`) so the same source can be applied on macOS and Linux.

## Requirements

```bash
# macOS / Linux
brew install chezmoi
# or: https://www.chezmoi.io/install/
```

## Usage

```bash
chezmoi init https://github.com/rangzen/dotfiles.git
chezmoi diff
chezmoi apply
```

To inspect the generated source: `chezmoi source-path`.

Do not run chezmoi and Stow against the same files at the same time; remove the old Stow links first.

## macOS and Linux

Templates use `.chezmoi.os` for platform-specific values. Hammerspoon is ignored on Linux.

Whispypy keeps its generated runtime configuration outside this repository. On each Linux machine, run its device discovery/validation tool once; the application saves the selected device in `~/.config/whispypy/config.conf`. This avoids versioning hardware-specific PipeWire IDs and lets Whispypy use its semi-automatic detection flow.

## WezTerm

- Starts maximized on the active screen
- No decorations, no tab bar, no padding
- Launches tmux directly on startup

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
| `tlt`  | Tmux Layout Tabs | `tlt <ai>` - three tabs: AI tool, nvim with file explorer, lazygit |
| `tsl`  | Tmux Split Launch | `tsl <count> <cmd>` - N tiled panes all running the same command |
