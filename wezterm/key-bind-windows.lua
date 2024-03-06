local wezterm = require 'wezterm';
function keyBind()
    keys = {
        { -- 清屏
            key = 'k',
            mods = 'ALT',
            action = wezterm.action.Multiple {
                wezterm.action.ClearScrollback 'ScrollbackAndViewport',
                wezterm.action.SendKey { key = 'L', mods = 'CTRL' },
            },
        },
        { -- 复制和结束任务
            key = 'c',
            mods = 'CTRL',
            action = wezterm.action_callback(function(window, pane)
                local has_selection = window:get_selection_text_for_pane(pane) ~= ''
                if has_selection then
                    window:perform_action(
                        act.CopyTo 'ClipboardAndPrimarySelection',
                        pane
                    )

                    window:perform_action(act.ClearSelection, pane)
                else
                    window:perform_action(
                        act.SendKey { key = 'c', mods = 'CTRL' },
                        pane
                    )
                end
            end),
        },
        { -- 关闭当前窗口
            key = 'w',
            mods = 'CTRL',
            action = wezterm.action.CloseCurrentTab { confirm = true },
        },
        { -- 控制左右移动面板
            key = 'LeftArrow',
            mods = 'ALT',
            action = wezterm.action {
                ActivateTabRelative = -1
            }
        }, {
            key = 'RightArrow',
            mods = 'ALT',
            action = wezterm.action {
                ActivateTabRelative = 1
            }
        }, { -- 展示启动器
            key = 'l',
            mods = 'ALT',
            action = wezterm.action.ShowLauncher
        }, { -- 新建窗口
            key = 'n',
            mods = 'ALT',
            action = wezterm.action.SpawnCommandInNewTab {
                label = 'PowerShell-NewWindow',
                args = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe', '-NoLogo' }
            },
        },
    }
    return keys
end
