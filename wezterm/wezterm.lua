local wezterm = require 'wezterm'

-- Using shell
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    term = '' -- Set to empty so FZF works on windows
    table.insert(launch_menu, {
        label = 'PowerShell-NewWindow',
        args = {"C:\\Windows\\System32\\WindowsPowerShell\\v7.3\\7\\pwsh.exe"}
    })
    default_prog = {"C:\\Windows\\System32\\WindowsPowerShell\\v7.3\\7\\pwsh.exe"}
    require("key-bind-windows")
elseif wezterm.target_triple == 'x86_64-apple-darwin' then
    table.insert(launch_menu, {
        label = 'Zsh-NewWindow',
        args = {'/bin/zsh', '-l'}
    })
    default_prog = {'/bin/zsh', '-l'}
    require("key-bind-mac")
elseif wezterm.target_triple == 'aarch64-apple-darwin' then
    default_prog = {'/bin/zsh', '-l'}
    require("key-bind-mac")
end


local config = {
    font_size = 14,
    font = wezterm.font("JetBrainsMonoNL Nerd Font", { weight = "Regular" }),
    use_fancy_tab_bar = false,
    hide_tab_bar_if_only_one_tab = true,
    window_decorations = "RESIZE" ,
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

    keys = keyBind(),

    -- Theme option
    color_scheme = 'Dracula',
    colors = {
    tab_bar = {
        -- 未激活的选项卡背景和前景颜色
        inactive_tab = {
            bg_color = "#282a36",
            fg_color = "#6272a4",
        },

        -- 悬停在未激活选项卡上时的背景和前景颜色
        inactive_tab_hover = {
            bg_color = "#282a36",
            fg_color = "#8be9fd",
        },

        -- 激活的选项卡背景和前景颜色
        active_tab = {
            bg_color = "#44475a",
            fg_color = "#50fa7b",
        },
    
        -- 选项卡栏的背景色
        background = "#282a36",
    },
},

}

return config