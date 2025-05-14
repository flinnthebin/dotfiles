-- ui.lua

local M = {}

function M.setup()
	-- dragonmode
	-- vim.cmd("colorscheme kanagawa-dragon")
	-- nightmode
	vim.cmd("colorscheme tokyonight-night")

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

	-- dragonmode indent-blankline
	local dragon_highlight = {
		"DragonRed",
		"DragonYellow",
		"DragonBlue",
		"DragonOrange",
		"DragonGreen",
		"DragonViolet",
		"DragonCyan",
	}

	-- nightmode indent-blankline
	local tokyo_highlight = {
		"TokyoRed",
		"TokyoYellow",
		"TokyoBlue",
		"TokyoOrange",
		"TokyoGreen",
		"TokyoMagenta",
		"TokyoCyan",
	}

	local hooks = require("ibl.hooks")
	-- create the highlight groups in the highlight setup hook, so they are reset
	-- every time the colorscheme changes
	hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
		vim.api.nvim_set_hl(0, "DragonRed", { fg = "#c4746e" })
		vim.api.nvim_set_hl(0, "DragonYellow", { fg = "#c4b28a" })
		vim.api.nvim_set_hl(0, "DragonBlue", { fg = "#8ba4b0" })
		vim.api.nvim_set_hl(0, "DragonOrange", { fg = "#B88D7A" })
		vim.api.nvim_set_hl(0, "DragonGreen", { fg = "#8a9a7b" })
		vim.api.nvim_set_hl(0, "DragonViolet", { fg = "#8892A7" })
		vim.api.nvim_set_hl(0, "DragonCyan", { fg = "#8ea4a2" })
		vim.api.nvim_set_hl(0, "TokyoRed", { fg = "#f7768e" })
		vim.api.nvim_set_hl(0, "TokyoYellow", { fg = "#e0af68" })
		vim.api.nvim_set_hl(0, "TokyoBlue", { fg = "#7aa2f7" })
		vim.api.nvim_set_hl(0, "TokyoOrange", { fg = "#ff9e64" })
		vim.api.nvim_set_hl(0, "TokyoGreen", { fg = "#9ece6a" })
		vim.api.nvim_set_hl(0, "TokyoMagenta", { fg = "#bb9af7" })
		vim.api.nvim_set_hl(0, "TokyoCyan", { fg = "#7dcfff" })
	end)

	require("ibl").setup({ indent = { highlight = tokyo_highlight } })

	-- todo
	require("todo-comments").setup({
		signs = false,
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
