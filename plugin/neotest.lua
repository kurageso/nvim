require("neotest").setup({
	adapters = {
		require("neotest-jest")({
			jestCommand = "npm test --",
			jestConfigFile = "jest.config.ts",
			env = { CI = true },
			cwd = function(path)
				return vim.fn.getcwd()
			end,
		}),

		require("neotest-rspec")({
			rspec_cmd = function()
				return vim.tbl_flatten({
					"bundle",
					"exec",
					"rspec",
				})
			end,
		}),

		require("neotest-go"),
	},
	-- overseer.nvim
	consumers = {
		overseer = require("neotest.consumers.overseer"),
	},
	overseer = {
		enabled = true,
		force_default = true,
	},

	icons = {
		child_indent = "│",
		child_prefix = "├",
		collapsed = "─",
		expanded = "╮",
		failed = "✖",
		final_child_indent = " ",
		final_child_prefix = "╰",
		non_collapsible = "─",
		passed = "✔",
		running = "🗘",
		running_animated = { "/", "|", "\\", "-", "/", "|", "\\", "-" },
		skipped = "ﰸ",
		unknown = "?",
	},
})
