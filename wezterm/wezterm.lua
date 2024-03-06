local wezterm = require("wezterm")
local default_prog;

local config = {
	font_size = 16,
	font = wezterm.font("FiraCode Nerd Font Mono", { weight = "Regular" }),
	color_scheme = "Catppuccin Mocha",

	use_fancy_tab_bar = false,
	hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	show_new_tab_button_in_tab_bar = false,
	window_background_opacity = 0.9,
	macos_window_background_blur = 70,
	text_background_opacity = 0.9,
	adjust_window_size_when_changing_font_size = false,

	window_padding = {
		left = 20,
		right = 20,
		top = 20,
		bottom = 5,
	},

	default_cursor_style = "BlinkingBar",
	cursor_thickness = 2,
	cursor_blink_rate = 500,
}

-- Using shell
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	config.default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }
	require("key-bind-windows")
elseif wezterm.target_triple == "x86_64-apple-darwin" then
	default_prog = { "/bin/zsh", "-l" }
	require("key-bind-mac")
elseif wezterm.target_triple == "aarch64-apple-darwin" then
	default_prog = { "/bin/zsh", "-l" }
	require("key-bind-mac")
end

return config
