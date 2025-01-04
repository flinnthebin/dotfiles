-- core.lua

local M = {}

function M.setup()
	require("gitsigns").setup({
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	})

	require("which-key").setup()
	require("which-key").register({
		["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
		["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
		["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
		["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
		["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
		["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
		["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
	})
	-- visual mode
	require("which-key").register({
		["<leader>h"] = { "Git [H]unk" },
	}, { mode = "v" })
end

return M
