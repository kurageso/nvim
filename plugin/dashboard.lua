require("dashboard").custom_center = {
	{
		icon = "  ",
		desc = "Recently latest session                  ",
		shortcut = "SPC s l",
		action = "SessionLoad",
	},
	{
		icon = "  ",
		desc = "Recently opened files                   ",
		action = "DashboardFindHistory",
		shortcut = "SPC f h",
	},
	{
		icon = "  ",
		desc = "Find  File                              ",
		action = "CocList files",
		shortcut = "SPC f f",
	},
	{
		icon = "  ",
		desc = "File Browser                            ",
		action = "Telescope file_browser",
		shortcut = "SPC f b",
	},
	{
		icon = "  ",
		desc = "Find  word                              ",
		action = "Telescope live_grep",
		shortcut = "SPC f w",
	},
	{
		icon = "  ",
		desc = "Open ~/.config/nvim/init.lua            ",
		action = ":tabe ~/.config/nvim/init.lua",
		shortcut = "SPC f d",
	},
	{
		icon = "  ",
		desc = "Open ~/.config/nvim/lua/keymaps.lua     ",
		action = ":tabe ~/.config/nvim/lua/keymaps.lua",
		shortcut = "SPC f k",
	},
}
