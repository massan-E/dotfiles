local wezterm = require("wezterm")
local config = wezterm.config_builder()
local act = wezterm.action

config.automatically_reload_config = false
config.font_size = 14.0
config.window_background_opacity = 0.75
config.macos_window_background_blur = 20

-- window size
config.initial_rows = 40
config.initial_cols = 140

config.max_fps = 120
config.animation_fps = 1
config.cursor_blink_rate = 0

----------------------------------------------------
-- Tab
----------------------------------------------------
-- タイトルバーを非表示
config.window_decorations = "RESIZE"
-- タブバーの表示
config.show_tabs_in_tab_bar = true
-- タブが一つの時は非表示
config.hide_tab_bar_if_only_one_tab = false
-- falseにするとタブバーの透過が効かなくなる
-- config.use_fancy_tab_bar = false

-- タブバーの透過
config.window_frame = {
	inactive_titlebar_bg = "none",
	active_titlebar_bg = "none",
}

-- タブバーを背景色に合わせる
config.window_background_gradient = {
	colors = { "#000000" },
}

-- タブの追加ボタンを非表示
config.show_new_tab_button_in_tab_bar = false
-- nightlyのみ使用可能
-- タブの閉じるボタンを非表示
config.show_close_tab_button_in_tabs = false

-- タブ同士の境界線を非表示
config.colors = {
	tab_bar = {
		inactive_tab_edge = "none",
	},
	-- カーソルの色設定
	cursor_bg = "#fc7400",
	cursor_fg = "#000000",
	cursor_border = "#F3A447",
	selection_bg = "#264E77",
}

-- タブの形をカスタマイズ
-- タブの左側の装飾
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
-- タブの右側の装飾
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
	local background = "#fc7400"
	local foreground = "#282828"
	local edge_background = "none"
	if tab.is_active then
		background = "#fc7400"
		foreground = "#282828"
	end
	local edge_foreground = background
	local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "
	return {
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_LEFT_ARROW },
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = title },
		{ Background = { Color = edge_background } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = SOLID_RIGHT_ARROW },
	}
end)

local last_workspace_name

wezterm.on("update-right-status", function(window, pane)
	local current_workspace_name = window:active_workspace()

	if last_workspace_name ~= current_workspace_name then
		local background = "#fc7400"
		local foreground = "#282828"
		local workspace_text = "  " .. current_workspace_name .. "  "

		window:set_right_status(wezterm.format({
			{ Background = { Color = background } },
			{ Foreground = { Color = foreground } },
			{ Text = workspace_text },
		}))

		last_workspace_name = current_workspace_name
	end
end)

config.keys = {
	-- reload
	{
		key = "r",
		mods = "CMD|SHIFT",
		action = wezterm.action.ReloadConfiguration,
	},
	-- close tab
	{
		key = "w",
		mods = "CMD",
		action = act.CloseCurrentPane({ confirm = true }),
	},
	-- pane split
	{
		key = ",",
		mods = "CMD",
		action = act({ SplitVertical = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = ".",
		mods = "CMD",
		action = act({ SplitHorizontal = { domain = "CurrentPaneDomain" } }),
	},
	{
		key = "LeftArrow",
		mods = "CMD",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CMD",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CMD",
		action = act.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CMD",
		action = act.ActivatePaneDirection("Down"),
	},
	-- workspace
	{
		key = "LeftArrow",
		mods = "ALT",
		action = act.SwitchWorkspaceRelative(1),
	},
	{
		key = "RightArrow",
		mods = "ALT",
		action = act.SwitchWorkspaceRelative(-1),
	},
	{
		key = "9",
		mods = "ALT",
		action = act.ShowLauncherArgs({
			flags = "FUZZY|WORKSPACES",
		}),
	},
	{ key = "Enter", mods = "SHIFT", action = act.SendString("\n") },
}
return config, {}
