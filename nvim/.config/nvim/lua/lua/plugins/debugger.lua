-- debugger.lua

local M = {}

function M.setup()
	local dap = require("dap")
	local dapui = require("dapui") -- Rename `ui` to `dapui` for clarity
	dapui.setup()

	dap.adapters.gdb = {
		type = "executable",
		command = "gdb",
		args = { "-i", "dap" },
	}

	dap.configurations.cpp = {
		{
			name = "Launch",
			type = "gdb",
			request = "launch",
			program = function()
				return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			end,
			cwd = "${workspaceFolder}",
			stopAtBeginningOfMainSubprogram = false,
			args = {},
			runInTerminal = true,
		},
	}

	require("nvim-dap-virtual-text").setup({
		display_callback = function(variable)
			local name = string.lower(variable.name)
			local value = string.lower(variable.value)
			if name:match("secret") or name:match("api") or value:match("secret") or value:match("api") then
				return "*****"
			end

			if #variable.value > 15 then
				return " " .. string.sub(variable.value, 1, 15) .. " ... "
			end

			return " " .. variable.value
		end,
	})

	-- DAP Keymaps
	vim.keymap.set("n", "<leader><space>b", dap.toggle_breakpoint)
	vim.keymap.set("n", "<leader><space>tbc", dap.run_to_cursor)
	vim.keymap.set("n", "<leader><space>c", dap.continue)
	vim.keymap.set("n", "<leader><space>s", dap.step_into)
	vim.keymap.set("n", "<leader><space>n", dap.step_over)
	vim.keymap.set("n", "<leader><space>f", dap.step_out)
	vim.keymap.set("n", "<leader><space>rc", dap.step_back)
	vim.keymap.set("n", "<leader><space>run", dap.restart)

	-- Evaluate variable under cursor
	vim.keymap.set("n", "<leader><space>?", function()
		dapui.eval(nil, { context = "hover", width = 50, height = 20, enter = true })
	end)

	-- DAP UI Listeners
	dap.listeners.before.attach.dapui_config = function()
		dapui.open()
	end

	dap.listeners.before.launch.dapui_config = function()
		dapui.open()
	end

	dap.listeners.before.event_terminated.dapui_config = function()
		dapui.close()
	end

	dap.listeners.before.event_exited.dapui_config = function()
		dapui.close()
	end
end

return M
