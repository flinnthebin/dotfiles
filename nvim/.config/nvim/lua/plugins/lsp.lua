-- lsp.lua

local M = {}

local diag_active = true

function M.toggle()
	diag_active = not diag_active
	if diag_active then
		vim.diagnostic.enable()
		print("LSP diagnostics enabled")
	else
		vim.diagnostic.enable(false)
		print("LSP diagnostics disabled")
	end
end

function M.setup()
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
		callback = function(event)
			local map = function(keys, func, desc)
				vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
			end
			map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
			map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
			map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
			map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
			map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
			map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols,
				"[W]orkspace [S]ymbols")
			map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
			map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
			map("K", vim.lsp.buf.hover, "Hover Documentation")
			map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
			map("<leader>tl", M.toggle, "[T]oggle [L]SP")
			local client = vim.lsp.get_client_by_id(event.data.client_id)
			if client and client.server_capabilities.documentHighlightProvider then
				local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight",
					{ clear = false })
				vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.document_highlight,
				})

				vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
					buffer = event.buf,
					group = highlight_augroup,
					callback = vim.lsp.buf.clear_references,
				})
			end
			if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
				map("<leader>th", function()
					vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
				end, "[T]oggle Inlay [H]ints")
			end
		end,
	})
	vim.api.nvim_create_autocmd("LspDetach", {
		group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
		callback = function(event)
			vim.lsp.buf.clear_references()
			-- Check if the group exists before clearing autocmds
			if pcall(vim.api.nvim_get_autocmds, { group = "kickstart-lsp-highlight" }) then
				vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event.buf })
			end
		end,
	})
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
	local terraform_ls = require("lspconfig")
	local terraform_cmd = { "/usr/local/bin/terraform-ls", "serve" }
	local terraform_config = {
		cmd = terraform_cmd,
		filetypes = { "terraform", "hcl" },
		capabilities = capabilities,
	}
	terraform_ls.terraformls.setup(terraform_config)
	local rust_lsp = require("lspconfig")
	local rust_cmd = { "/home/archer/.cargo/bin/rust-analyzer" }
	local rust_config = {
		cmd = rust_cmd,
		filetypes = { "rust" },
		root_dir = rust_lsp.util.root_pattern("Cargo.toml", ".git"),
		capabilities = capabilities,
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
					loadOutDirsFromCheck = true,
				},
				check = {
					command = "clippy",
				},
				procMacro = {
					enable = true,
				},
				inlayHints = {
					lifetimeElisionHints = {
						enable = true,
						useParameterNames = true,
					},
					parameterHints = {
						enable = true,
					},
					typeHints = {
						enable = true,
					},
				},
			},
		},
	}
	rust_lsp.rust_analyzer.setup(rust_config)
	local servers = {}
	require("mason").setup()
	local ensure_installed = vim.tbl_keys(servers or {})
	vim.list_extend(ensure_installed, {
		"stylua",
	})
	require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
	require("mason-lspconfig").setup({
		ensure_installed = vim.tbl_keys(servers),
		automatic_installation = true,
		handlers = {
			function(server_name)
				local server = servers[server_name] or {}
				server.capabilities = vim.tbl_deep_extend("force", {}, capabilities,
					server.capabilities or {})
				require("lspconfig")[server_name].setup(server)
			end,
		},
	})
end

return M
