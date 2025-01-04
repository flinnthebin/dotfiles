-- autocommands.lua
local M = {}

-- Highlight on yank
function M.setup_yank_highlight()
	vim.api.nvim_create_autocmd("TextYankPost", {
		desc = "Highlight when yanking (copying) text",
		group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
		callback = function()
			vim.highlight.on_yank()
		end,
	})
end

-- Filetype-specific comment keymaps
function M.setup_comment_keymaps()
	local comment_markers = {
		c = "//",
		cpp = "//",
		java = "//",
		go = "//",
		javascript = "//",
		typescript = "//",
		rust = "//",
		python = "#",
		bash = "#",
		ruby = "#",
		ocaml = "#",
	}

	local function set_comment_keymap()
		local ft = vim.bo.filetype
		local marker = comment_markers[ft]
		if marker then
			-- Normal mode single-line comment
			vim.api.nvim_buf_set_keymap(
				0,
				"n",
				"<leader>c",
				"I" .. marker .. "<esc>",
				{ noremap = true, silent = true }
			)

			-- Visual mode multi-line comment
			vim.api.nvim_buf_set_keymap(
				0,
				"v",
				"<leader>c",
				":s/^/" .. marker .. "/<CR>gv",
				{ noremap = true, silent = true }
			)
		end
	end

	vim.api.nvim_create_autocmd("FileType", {
		callback = set_comment_keymap,
		group = vim.api.nvim_create_augroup("comment-keymaps", { clear = true }),
	})
end

-- Debug tag insertion
function M.setup_debug_tag()
	vim.api.nvim_set_keymap("n", "<leader>db", ":lua InsertDebugTag()<CR>", { noremap = true, silent = true })

	function _G.InsertDebugTag()
		local filetype = vim.bo.filetype
		local lines = nil

		if
			filetype == "c"
			or filetype == "cpp"
			or filetype == "java"
			or filetype == "go"
			or filetype == "javascript"
			or filetype == "typescript"
			or filetype == "rust"
		then
			lines = {
				"/////////////",
				"//  Debug  //",
				"/////////////",
			}
		elseif filetype == "python" or filetype == "bash" or filetype == "ruby" or filetype == "ocaml" then
			lines = {
				"#############",
				"#   Debug   #",
				"#############",
			}
		else
			print("Debug tag not defined for this file type: " .. filetype)
			return
		end

		local line = vim.fn.line(".")
		for i, l in ipairs(lines) do
			vim.fn.append(line + i - 1, l)
		end
		vim.cmd("normal! j")
	end
end

function M.setup()
	M.setup_yank_highlight()
	M.setup_comment_keymaps()
	M.setup_debug_tag()
end

return M
