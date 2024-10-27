local wezterm = require("wezterm")

--- Env vars
local CONFIG_PATH = "/home/felix/.config/wezterm"

local config = {}

--- colors & appearance
---  color schmem
config.color_scheme = "Gruvbox Dark (Gogh)"
---  tab bar
local color_define = wezterm.color.get_builtin_schemes()[config.color_scheme]
config.hide_tab_bar_if_only_one_tab = true
config.window_frame = {
    font = wezterm.font { family = "FiraCode Nerd Font", weight = "Bold" },
    font_size = 12.0,
    active_titlebar_bg = color_define.background,
    inactive_titlebar_bg = color_define.background,
}
config.colors = {
    tab_bar = {
        background = color_define.background,
        active_tab = {
            bg_color = color_define.selection_bg,
            fg_color = color_define.selection_fg,
        },
        inactive_tab = {
            bg_color = color_define.background,
            fg_color = color_define.foreground,
        },
        inactive_tab_hover = {
            bg_color = color_define.cursor_bg,
            fg_color = color_define.cursor_fg,
        },
        new_tab = {
            bg_color = color_define.background,
            fg_color = color_define.foreground,
        },
        new_tab_hover = {
            bg_color = color_define.cursor_bg,
            fg_color = color_define.cursor_fg,
        },
    },
}
--- window
config.window_decorations = "RESIZE"
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
--- font
config.font = wezterm.font("FiraCode Nerd Font Mono")
config.font_size = 12
config.warn_about_missing_glyphs = false
--- image slider
local BG_IMGS = {
    "ys_babala.png",
    "ys_bachongshenzi.png",
    "ys_feixieer2.png",
    "ys_feixieer.png",
    "ys_funingna.png",
    "ys_ganyv2.png",
    "ys_ganyv.png",
    "ys_hutao.png",
    "ys_keqing2.png",
    "ys_keqing.png",
    "ys_linnite.png",
    "ys_mona.png",
    "ys_naxida.png",
    "ys_nilu2.png",
    "ys_nilu.png",
    "ys_ningguang.png",
    "ys_qiliangliang2.png",
    "ys_qiliangliang.png",
    "ys_qin.png",
    "ys_shenhe2.png",
    "ys_shenhe.png",
    "ys_shenlilinghua2.png",
    "ys_shenlilinghua.png",
    "ys_xiaogong.png",
    "ys_xinhai.png",
    "ys_ying.png",
}
config.background = {
    {
        source = {
            Color = color_define.background,
        },
        width = "100%",
        height = "100%",
        opacity = 1.0,
    },
    {
        source = {
            File = CONFIG_PATH .. "/bg_imgs/" .. BG_IMGS[tonumber(wezterm.time.now():format("%M")) % #BG_IMGS + 1],
        },
        width = "Contain",
        height = "Contain",
        vertical_align = "Middle",
        horizontal_align = "Center",
        repeat_x = "NoRepeat",
        repeat_y = "NoRepeat",
        opacity = 0.05,
    },
}
wezterm.time.call_after(60, function()
    wezterm.reload_configuration()
end)

--- default prog
config.default_prog = {}
--- launch menu
config.launch_menu = {
}

--- keys
config.keys = {}
--- ALT + number select tab
for i = 1, 8 do
    config.keys[#config.keys + 1] = {
        key = tostring(i),
        mods = "ALT",
        action = wezterm.action.ActivateTab(i - 1),

    }
end

--- CTRL + number run quick commands
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

--- ALT + 0 show launch
config.keys[#config.keys + 1] = { key = '0', mods = 'ALT', action = wezterm.action.ShowLauncher }

return config
