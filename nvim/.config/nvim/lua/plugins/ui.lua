-- ui.lua

local M = {}

function M.setup()
	-- dragonmode
	vim.cmd("colorscheme kanagawa-dragon")

	-- icons
	vim.g.have_nerd_font = vim.g.have_nerd_font or false
	require("lazy").setup({
		ui = {
			icons = vim.g.have_nerd_font and {} or {
				cmd = "⌘",
				config = "🛠",
				event = "📅",
				ft = "📂",
				init = "⚙",
				keys = "🗝",
				plugin = "🔌",
				runtime = "💻",
				require = "🌙",
				source = "📄",
				start = "🚀",
				task = "📌",
				lazy = "💤 ",
			},
		},
	})

	-- indent-blankline
	local highlight = {
		"RainbowRed",
		"RainbowYellow",
		"RainbowBlue",
		"RainbowOrange",
		"RainbowGreen",
		"RainbowViolet",
		"RainbowCyan",
	}

	local hooks = require("ibl.hooks")
	-- create the highlight groups in the highlight setup hook, so they are reset
	-- every time the colorscheme changes
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
		vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
		vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
		vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
		vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
		vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
		vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
	end)

	require("ibl").setup({ indent = { highlight = highlight } })

	-- todo
	require("todo-comments").setup({
		signs = false,
	})

	-- dashboard
	require("dashboard").setup({
		theme = "hyper",
		config = {
			header = {

				" ███╗   ██╗██╗   ██╗██╗███╗   ███╗       ██████╗ ████████╗██╗    ██╗ ",
				" ████╗  ██║██║   ██║██║████╗ ████║       ██╔══██╗╚══██╔══╝██║    ██║ ",
				" ██╔██╗ ██║██║   ██║██║██╔████╔██║       ██████╔╝   ██║   ██║ █╗ ██║ ",
				" ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║       ██╔══██╗   ██║   ██║███╗██║ ",
				" ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║▄█╗    ██████╔╝   ██║   ╚███╔███╔╝ ",
				" ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝    ╚═════╝    ╚═╝    ╚══╝╚══╝  ",
			},
			shortcut = {
				{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
				{
					icon = " ",
					icon_hl = "@variable",
					desc = "Files",
					group = "Label",
					action = "Telescope find_files",
					key = "f",
				},
				{
					desc = " Apps",
					group = "DiagnosticHint",
					action = "Telescope app",
					key = "a",
				},
				{
					desc = " dotfiles",
					group = "Number",
					action = "Telescope dotfiles",
					key = "d",
				},
			},
			packages = { enable = true },
			project = {
				enable = true,
				limit = 8,
				icon = "",
				label = "Projects",
				action = function(path)
					vim.cmd("Telescope find_files cwd=" .. path)
				end,
			},
			mru = {
				enable = true,
				limit = 10,
				icon = "",
				label = "Recent Files",
				cwd_only = false,
			},
			footer = { "make something" },
		},
	})

	-- mini.ai setup
	require("mini.ai").setup({ n_lines = 500 })
	-- mini.surround setup
	require("mini.surround").setup()
	-- mini.statusline setup
	require("mini.statusline").setup({
		use_icons = vim.g.have_nerd_font,
	})
	-- override the section_location function for statusline
	MiniStatusline.section_location = function()
		return "%2l:%-2v"
	end
	-- mini.indentscope setup
	require("mini.indentscope").setup({
		symbol = "│",
		options = { try_as_border = true },
	})
	-- disable mini.indentscope for specific filetypes
	vim.api.nvim_create_autocmd("FileType", {
		pattern = {
			"help",
			"alpha",
			"dashboard",
			"neo-tree",
			"Trouble",
			"trouble",
			"lazy",
			"mason",
			"notify",
			"toggleterm",
			"lazyterm",
		},
		callback = function()
			vim.b.miniindentscope_disable = true
		end,
	})
end

return M
