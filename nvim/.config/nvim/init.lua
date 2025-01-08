local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.g.have_nerd_font = true
require("lazy").setup({
	-- Core plugins
	"tpope/vim-sleuth",
	{ "numToStr/Comment.nvim", opts = {} },
	{ "lewis6991/gitsigns.nvim" },
	{ "folke/which-key.nvim" },
	{ "mbbill/undotree" },

	-- UI
	{ "rose-pine/neovim" },
	{ "folke/tokyonight.nvim" },
	{ "rebelot/kanagawa.nvim" },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{ "echasnovski/mini.nvim" },
	{ "echasnovski/mini.indentscope" },

	-- Autoformat
	{ "stevearc/conform.nvim" },
	-- Autocomplete
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
			},
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
	},

	-- Debugger
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"git@github.com:leoluz/nvim-dap-go.git",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			{ "folke/neodev.nvim", opts = {} },
		},
	},

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/playground", opts = {} },

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
	},
}, {})

require("config.autocommands").setup()
require("config.keymaps").setup()
require("config.glyphs").setup()
require("plugins.core").setup()
require("plugins.ui").setup()
require("plugins.auto").setup()
require("plugins.debugger").setup()
require("plugins.lsp").setup()
require("plugins.treesitter").setup()
require("plugins.telescope").setup()
