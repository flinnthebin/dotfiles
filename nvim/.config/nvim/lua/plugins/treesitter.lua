-- treesitter.lua

local M = {}

function M.setup()
	local opts = {
		ensure_installed = {
			"bash",
			"c",
			"go",
			"html",
			"lua",
			"luadoc",
			"markdown",
			"python",
			"vim",
			"vimdoc",
		},
		auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = { "ruby" },
		},
		indent = {
			enable = true,
			disable = { "ruby" },
		},
	}

	-- Prefer git for installation
	require("nvim-treesitter.install").prefer_git = true

	-- Apply configuration
	require("nvim-treesitter.configs").setup(opts)
end

return M
