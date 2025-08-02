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
	require("which-key").add({
		{ "<leader>c",  group = "[C]ode" },
		{ "<leader>c_", hidden = true },
		{ "<leader>d",  group = "[D]ocument" },
		{ "<leader>d_", hidden = true },
		{ "<leader>h",  group = "Git [H]unk" },
		{ "<leader>h_", hidden = true },
		{ "<leader>r",  group = "[R]ename" },
		{ "<leader>r_", hidden = true },
		{ "<leader>s",  group = "[S]earch" },
		{ "<leader>s_", hidden = true },
		{ "<leader>t",  group = "[T]oggle" },
		{ "<leader>t_", hidden = true },
		{ "<leader>w",  group = "[W]orkspace" },
		{ "<leader>w_", hidden = true },
	})
	-- visual mode
	require("which-key").add({
		{ "<leader>h", desc = "Git [H]unk", mode = "v" },
	})
end

return M
