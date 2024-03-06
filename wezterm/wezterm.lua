local wezterm = require("wezterm")

local launch_menu = {}
local default_prog = {}
local set_environment_variables = {}

-- Using shell
if wezterm.target_triple == "x86_64-pc-windows-msvc" then
	term = '' -- Set to empty so FZF works on windows
	table.insert(launch_menu, {
        label = 'PowerShell-NewWindow',
        args = {"C:\\Program Files\\PowerShell\\7\\pwsh.exe"}
    })
	default_prog = { "C:\\Program Files\\PowerShell\\7\\pwsh.exe" }
	require("key-bind-windows")
elseif wezterm.target_triple == "x86_64-apple-darwin" then
	table.insert(launch_menu, {
        label = 'Zsh-NewWindow',
        args = {'/bin/zsh', '-l'}
    })
	default_prog = { "/bin/zsh", "-l" }
	require("key-bind-mac")
elseif wezterm.target_triple == "aarch64-apple-darwin" then
	table.insert(launch_menu, {
        label = 'zsh',
        args = {'/opt/homebrew/bin/zsh', '-l'}
    })
	default_prog = { "/bin/zsh", "-l" }
	require("key-bind-mac")
end

local config = {
	font_size = 15,
	font = wezterm.font("JetBrainsMonoNL Nerd Font", { weight = "Regular" }),
	color_scheme = "Catppuccin Mocha",

	use_fancy_tab_bar = false,
	-- hide_tab_bar_if_only_one_tab = true,
	window_decorations = "RESIZE",
	show_new_tab_button_in_tab_bar = false,
	window_background_opacity = 0.95,
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

	default_prog = default_prog,

	set_environment_variables = set_environment_variables,

	disable_default_key_bindings = false,
    -- Allow using ^ with single key press.
    use_dead_keys = false,
    keys = keyBind(),
}


return config
