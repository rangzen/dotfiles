local wezterm = require("wezterm")

return {

	-- No decorations whatsoever
	window_decorations = "NONE",

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
}
