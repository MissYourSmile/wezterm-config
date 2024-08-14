local wezterm = require("wezterm")

local config = {}

config.color_scheme = "Gruvbox Dark (Gogh)"

config.window_frame = {
    font = wezterm.font { family = "FiraCode Nerd Font", weight = "Bold" },
    font_size = 12.0,
    active_titlebar_bg = "#282828",
    inactive_titlebar_bg = "#282828",
}
config.window_decorations = "RESIZE"

config.colors = {
    tab_bar = {
        background = "#282828",
        active_tab = {
            bg_color = "#282828",
            fg_color = "#fbf1c7",
        },
        inactive_tab = {
            bg_color = "#282828",
            fg_color = "#a89984",
        },
        inactive_tab_hover = {
            bg_color = "#282828",
            fg_color = "#fbf1c7",
        },
        new_tab = {
            bg_color = "#282828",
            fg_color = "#a89984",
        },
        new_tab_hover = {
            bg_color = "#282828",
            fg_color = "#fbf1c7",
        },
    },
}
config.hide_tab_bar_if_only_one_tab = true

config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}

config.background = {
    {
        source = {
            Color = "#282828",
        },
        width = "100%",
        height = "100%",
        opacity = 1.0,
    },
    {
        source = {
            File = "/home/felix/.config/wezterm/ys_keqing.png",
        },
        vertical_align = "Middle",
        horizontal_align = "Right",
        opacity = 0.6,
    },
}

config.launch_menu = {
    {
        label = "zsh"
    }
}

config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 12
config.warn_about_missing_glyphs = false

config.keys = {}

for i = 1, 8 do
    config.keys[#config.keys + 1] = {
        key = tostring(i),
        mods = "ALT",
        action = wezterm.action.ActivateTab(i - 1),

    }
end

local quick_cmds = {
}

for i, cmd in ipairs(quick_cmds) do
    if i > 8 then
        break
    end
    config.keys[#config.keys + 1] = {
        key = tostring(i),
        mods = "CTRL",
        action = wezterm.action.SendString(cmd),
    }
end

config.keys[#config.keys + 1] = { key = '0', mods = 'ALT', action = wezterm.action.ShowLauncher }

return config
