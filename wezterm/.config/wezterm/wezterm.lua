local wezterm = require("wezterm")

-- Start fullscreen
wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	local gui_win = window:gui_window()
	local screens = wezterm.gui.screens()
	local screen = screens.active
	gui_win:set_position(screen.x, screen.y)
	gui_win:maximize()
end)

return {

	-- No decorations whatsoever
	window_decorations = "NONE",
	enable_wayland = false,
	-- Check https://github.com/wezterm/wezterm/issues/6275
	-- enable_wayland needed for window_decorations None

	-- Hide tab bar (even with one tab)
	enable_tab_bar = false,

	-- No status line
	show_tab_index_in_tab_bar = false,

	-- No padding around the terminal content
	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	-- Run tmux directly
	default_prog = { "tmux", "new-session", "-A", "-s", "main" },
}
