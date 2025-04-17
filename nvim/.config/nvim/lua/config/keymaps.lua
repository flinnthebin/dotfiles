-- keymaps.lua

local M = {}

function M.setup()
	-- General settings
	vim.g.mapleader = ";"
	vim.g.maplocalleader = ";"

	-- General options
	vim.opt.compatible = false
	vim.opt.textwidth = 120
	vim.opt.encoding = "utf-8"
	vim.opt.number = true
	vim.opt.relativenumber = true
	vim.opt.wrap = true
	vim.opt.numberwidth = 2
	vim.opt.tabstop = 2
	vim.opt.shiftwidth = 2
	vim.opt.expandtab = true
	vim.opt.showmatch = true
	vim.opt.matchtime = 3
	vim.opt.mouse = "a"
	vim.opt.showmode = false
	vim.opt.clipboard = "unnamedplus"
	vim.opt.breakindent = true
	vim.opt.undofile = true
	vim.opt.list = true
	vim.opt.listchars = { tab = "│ ", trail = "·", nbsp = "␣" }
	vim.opt.conceallevel = 2
	vim.opt.inccommand = "split"
	vim.opt.cursorline = true
	vim.opt.ignorecase = true
	vim.opt.smartcase = true
	vim.opt.signcolumn = "yes"
	vim.opt.updatetime = 250
	vim.opt.timeoutlen = 300
	vim.opt.splitright = true
	vim.opt.splitbelow = true
	vim.opt.iskeyword:append("?")
	vim.opt.statusline = '%f%=%c,%{strlen(getline("."))}|%l/%L'
	vim.opt.path:append("**")
	vim.opt.wildmenu = true
	vim.opt.tags:append("./tags;")

	-- Enable default plugins
	vim.cmd("syntax on")
	vim.cmd("filetype plugin on")

	-- Netrw configuration
	vim.g.netrw_banner = 0
	vim.g.netrw_browse_split = 0
	vim.g.netrw_altv = 1
	vim.g.netrw_liststyle = 3
	vim.g.netrw_winsize = 25

	-- Keymaps
	local keymaps = {
		-- Remove search highlight
		{ mode = "n", lhs = "<Esc>", rhs = "<cmd>nohlsearch<CR>", opts = { desc = "Clear search highlight" } },

		-- Diagnostic navigation
		{ mode = "n", lhs = "[d", rhs = vim.diagnostic.goto_prev, opts = { desc = "Previous [D]iagnostic message" } },
		{ mode = "n", lhs = "]d", rhs = vim.diagnostic.goto_next, opts = { desc = "Next [D]iagnostic message" } },
		{
			mode = "n",
			lhs = "<leader>e",
			rhs = vim.diagnostic.open_float,
			opts = { desc = "Show diagnostic [E]rror messages" },
		},
		{
			mode = "n",
			lhs = "<leader>q",
			rhs = vim.diagnostic.setloclist,
			opts = { desc = "Open diagnostics [Q]uickfix list" },
		},

		-- Undo Tree
		{ mode = "n", lhs = "<leader>u", rhs = vim.cmd.UndotreeToggle, opts = { desc = "Toggle Undo Tree" } },

		-- Terminal mode exit
		{ mode = "t", lhs = "<Esc><Esc>", rhs = "<C-\\><C-n>", opts = { desc = "Exit terminal mode" } },

		-- Window navigation
		{ mode = "n", lhs = "<C-h>", rhs = "<C-w>h", opts = { desc = "Move left" } },
		{ mode = "n", lhs = "<C-l>", rhs = "<C-w>l", opts = { desc = "Move right" } },
		{ mode = "n", lhs = "<C-j>", rhs = "<C-w>j", opts = { desc = "Move down" } },
		{ mode = "n", lhs = "<C-k>", rhs = "<C-w>k", opts = { desc = "Move up" } },

		-- Logical mappings
		{ mode = "n", lhs = "0", rhs = "H", opts = { noremap = true } },
		{ mode = "n", lhs = "$", rhs = "L", opts = { noremap = true } },
		{ mode = "n", lhs = "H", rhs = "0", opts = { noremap = true } },
		{ mode = "n", lhs = "L", rhs = "$", opts = { noremap = true } },
		{ mode = "v", lhs = "0", rhs = "H", opts = { noremap = true } },
		{ mode = "v", lhs = "$", rhs = "L", opts = { noremap = true } },
		{ mode = "v", lhs = "H", rhs = "0", opts = { noremap = true } },
		{ mode = "v", lhs = "L", rhs = "$", opts = { noremap = true } },

		-- Fast exit
		{ mode = "i", lhs = "jk", rhs = "<esc>", opts = { noremap = true } },
		-- Swap line with line below
		{ mode = "n", lhs = "-", rhs = "ddp", opts = { noremap = true } },

		-- Insert Mode
		-- Move cursor backwards char by char
		{ mode = "i", lhs = "<C-x>", rhs = "<esc>xi", opts = { noremap = true } },
		-- Delete current line
		{ mode = "i", lhs = "<C-d>", rhs = "<esc>ddi", opts = { noremap = true } },
		-- Undo all changes on the current line
		{ mode = "i", lhs = "<C-u>", rhs = "<esc>Ui", opts = { noremap = true } },

		-- Indentation
		{ mode = "n", lhs = "<Left>", rhs = "<<", opts = { noremap = true } },
		{ mode = "n", lhs = "<Right>", rhs = ">>", opts = { noremap = true } },
		{ mode = "n", lhs = "<Up>", rhs = "{", opts = { noremap = true } },
		{ mode = "n", lhs = "<Down>", rhs = "}", opts = { noremap = true } },
		{ mode = "v", lhs = "<Left>", rhs = "<gv", opts = { noremap = true } },
		{ mode = "v", lhs = "<Right>", rhs = ">gv", opts = { noremap = true } },
		{ mode = "v", lhs = "<Up>", rhs = "{", opts = { noremap = true } },
		{ mode = "v", lhs = "<Down>", rhs = "}", opts = { noremap = true } },
		{ mode = "v", lhs = "<", rhs = "<gv", opts = { noremap = true, silent = true } },
		{ mode = "v", lhs = ">", rhs = ">gv", opts = { noremap = true, silent = true } },

		-- Code Action
		{
			mode = "n",
			lhs = "<leader>ca",
			rhs = vim.lsp.buf.code_action,
			opts = { desc = "LSP: Code Action", noremap = true, silent = true },
		},

		-- Rustfmt
		{
			mode = "n",
			lhs = "<leader>F",
			rhs = function()
				vim.cmd("silent! write")
				vim.cmd("silent! !rustfmt %")
				vim.cmd("silent! edit")
			end,
			opts = { desc = "[F]ormat rustfmt" },
		},
	}

	for _, map in ipairs(keymaps) do
		vim.keymap.set(map.mode, map.lhs, map.rhs, map.opts or {})
	end

	-- Command definitions
	vim.api.nvim_create_user_command("MakeTags", "!ctags -R .", {})
end

return M
