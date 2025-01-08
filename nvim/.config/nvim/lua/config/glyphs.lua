-- glyphs.lua

local M = {}

function M.setup()
	vim.api.nvim_set_hl(0, "ArrowSymbol", { fg = "#c4746e" })
	vim.cmd([[
    syntax match ArrowSymbol /->/ conceal cchar=
  ]])
	vim.o.conceallevel = 2
end

return M
