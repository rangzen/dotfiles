# dotfiles

My personal dotfiles, managed with [chezmoi](https://www.chezmoi.io/).

This repository is a chezmoi source directory. Files use chezmoi's naming conventions (`dot_`, `executable_`, and `.tmpl`) so the same source can be applied on macOS and Linux.

## Requirements

```bash
# macOS / Linux
brew install chezmoi
# or: https://www.chezmoi.io/install/
```

[mise](https://mise.jdx.dev/) is also required to install the CLI tools listed below.
Install it manually first: `https://mise.jdx.dev/getting-started.html`.

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

## mise

CLI tools declared in `~/.config/mise/config.toml`, installed with `mise install`.
Machine-specific tools and secrets go in `~/.config/mise/config.local.toml`, which mise merges in but chezmoi never manages.

| Tool | Description |
|------|-------------|
| [bat](https://github.com/sharkdp/bat) | `cat` clone with syntax highlighting and Git integration |
| [delta](https://github.com/dandavison/delta) | Syntax-highlighting pager for `git`/`diff` output |
| [eza](https://github.com/eza-community/eza) | Modern replacement for `ls` with icons and Git status |
| [fd](https://github.com/sharkdp/fd) | Fast, user-friendly alternative to `find` |
| [fzf](https://github.com/junegunn/fzf) | Command-line fuzzy finder |
| [lazydocker](https://github.com/jesseduffield/lazydocker) | Terminal UI for Docker and Docker Compose |
| [lazygit](https://github.com/jesseduffield/lazygit) | Terminal UI for `git` commands |
| [rg (ripgrep)](https://github.com/BurntSushi/ripgrep) | Fast recursive search that respects `.gitignore` |
| [starship](https://starship.rs/) | Fast, customizable cross-shell prompt |
| [tmux](https://github.com/tmux/tmux) | Terminal multiplexer |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smarter `cd` that learns your most-used directories |

### Adding machine-specific tools

Only tools every machine needs belong in the versioned `config.toml`.
Anything specific to one machine (language runtimes, work-only CLIs, API keys) goes in `~/.config/mise/config.local.toml` instead, which is not part of this repository and is never applied by chezmoi.

Add a tool without opening an editor:

```bash
mise use -g --path ~/.config/mise/config.local.toml node@lts
```

Or edit the file directly, which is also required for `[env]` since `mise use` only manages `[tools]`:

```bash
mkdir -p ~/.config/mise
$EDITOR ~/.config/mise/config.local.toml
```

```toml
[tools]
node = "lts"

[env]
SOME_API_KEY = "..."
```

Run `mise install` afterwards. `mise config` shows which file each active tool comes from.

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
