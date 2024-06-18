-- Set mapleader
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"
-- Turn off Vi backwards compatibility
vim.opt.compatible = false
-- Formatting
vim.g.have_nerd_font = true
vim.opt.textwidth = 120
vim.cmd("syntax on")
vim.opt.encoding = "utf-8"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.numberwidth = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
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
vim.opt.inccommand = "split"
vim.opt.cursorline = true
-- General config
vim.opt.showmode = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.scrolloff = 23
-- Window Splits
vim.opt.splitright = true
vim.opt.splitbelow = true
-- Define what a word is (navigation)
vim.opt.iskeyword:append("?")
-- Statusline
vim.opt.statusline = '%f%=%c,%{strlen(getline("."))}|%l/%L'
-- Welcome message
vim.cmd('echom "SHIFT + K = keyword lookup"')
vim.cmd('echom " "')
vim.cmd('echom ":help ins-completion = AUTOCOMPLETE COMMANDS"')
vim.cmd('echom " "')
vim.cmd('echom ":help netrw-browse-maps = FILE BROWSING MAPPINGS"')
vim.cmd('echom " "')
vim.cmd('echom ":help c_<command> i_<command>, v_<command> for non-normal mode command help"')
vim.cmd('echom " "')
vim.cmd('echom ":helpgrep <term> to grep all help files. nav :cn, :ca, :cl"')
-- Enable the VIM default plugin netrw
-- Supports FTP, HTTP, SCP. Enables directory traversal and file interaction
-- Enable recursive directory traversal to create a fuzzy finder.
vim.cmd("filetype plugin on")
-- FZF
-- Set - command that changes a built-in configuration variable (path)
-- += - append to the existing value of variable (default value for path
-- variable)
-- ** - recursive wildcard pattern. vim should not only search directories in
-- the path, but all subdirectories to unlimited depth
vim.opt.path:append("**")
-- Display all matching files on tab-complete
-- :find tabs through partial matches
-- :b <substring> autocompletes from the file buffer
-- :ls jumps to recently buffered file
vim.opt.wildmenu = true
-- TAG JUMPING
-- Install ctags
vim.opt.tags:append("./tags;")
-- Create the `tags` file
vim.cmd("command! MakeTags !ctags -R .")
-- ^] - jump to tag under cursor
-- " g^] - jump to ambiguous tag
-- ^t - jump back up the tag stack
-- ctags -R . - search recursively
-- - ^n and ^p toggle autocomplete (NP Complete lmao)
-- FILE BROWSING
-- Disable netrw banner
vim.g.netrw_banner = 0
-- Open in prior window
vim.g.netrw_browse_split = 0
-- Open splits to the right
vim.g.netrw_altv = 1
-- Tree view
vim.g.netrw_liststyle = 3
-- Set window size
vim.g.netrw_winsize = 25
-- vim.g.netrw_list_hide = vim.fn.netrw_gitignore#Hide()
-- vim.g.netrw_list_hide = vim.g.netrw_list_hide .. ',\\(\\^\\|\\s\\s\\)\\zs\\.S\\+'
-- Keymaps
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })
-- Exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- Split navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
-- Little Linter
vim.api.nvim_set_keymap("n", "<leader>L", ":%%!lindt<CR>", { noremap = true })
-- Enclose selected text in quotations/brackets
vim.api.nvim_set_keymap("n", "<leader>'", "viw<esc>a'<esc>hbi'<esc>lel", { noremap = true })
vim.api.nvim_set_keymap("n", '<leader>"', 'viw<esc>a"<esc>hbi"<esc>lel', { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>{", "viw<esc>a}<esc>hbi{<esc>lel", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>[", "viw<esc>a]<esc>hbi[<esc>lel", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>(", "viw<esc>a)<esc>hbi(<esc>lel", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader><", "viw<esc>a><esc>hbi<<esc>lel", { noremap = true })
-- Logical Mappings for Start/End of Line/Document
vim.api.nvim_set_keymap("n", "0", "H", { noremap = true })
vim.api.nvim_set_keymap("n", "$", "L", { noremap = true })
vim.api.nvim_set_keymap("n", "H", "0", { noremap = true })
vim.api.nvim_set_keymap("n", "L", "$", { noremap = true })
vim.api.nvim_set_keymap("v", "0", "H", { noremap = true })
vim.api.nvim_set_keymap("v", "$", "L", { noremap = true })
vim.api.nvim_set_keymap("v", "H", "0", { noremap = true })
vim.api.nvim_set_keymap("v", "L", "$", { noremap = true })
-- Exit normal mode (but quickly)
vim.api.nvim_set_keymap("i", "jk", "<esc>", { noremap = true })
-- Swap line with line below
vim.api.nvim_set_keymap("n", "-", "ddp", { noremap = true })
-- MIMGA (Make Insert Mode Great Again)
-- Move cursor backwards char-by-char in insert mode
vim.api.nvim_set_keymap("i", "<c-x>", "<esc>xi", { noremap = true })
-- Delete current line in insert mode
vim.api.nvim_set_keymap("i", "<c-d>", "<esc>ddi", { noremap = true })
-- Undo all changes on the current line in insert mode
vim.api.nvim_set_keymap("i", "<c-u>", "<esc>Ui", { noremap = true })
-- Arrow keys adjust indentation, paragraph navigation
vim.api.nvim_set_keymap("n", "<Left>", "<<", { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", ">>", { noremap = true })
vim.api.nvim_set_keymap("v", "<Left>", "<gv", { noremap = true })
vim.api.nvim_set_keymap("v", "<Right>", ">gv", { noremap = true })
vim.api.nvim_set_keymap("n", "<Up>", "{", { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", "}", { noremap = true })
vim.api.nvim_set_keymap("v", "<Up>", "{", { noremap = true })
vim.api.nvim_set_keymap("v", "<Down>", "}", { noremap = true })
-- Autocommands
-- File Autogroups (<leader>c for commenting out lines)
-- vim - defines code folding in vimscript files using
-- text markers '{{{' and '}}}'
vim.cmd([[
augroup vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
    autocmd FileType vim nnoremap <buffer> <leader>c I"<esc>
augroup end
]])

-- Comment out line on language
vim.cmd([[
augroup commentAutocmds
    autocmd!
    autocmd FileType c,cpp,java,go,javascript,typescript,rust nnoremap <buffer> <leader>c I//<esc>
    autocmd FileType python,bash,ruby,ocaml nnoremap <buffer> <leader>c I#<esc>
augroup end
]])
-- Comment out multiple selected lines in visual mode
vim.cmd([[
augroup commentAutocmds
    autocmd!
    autocmd FileType c,cpp,java,go,javascript,typescript,rust
        \ vnoremap <buffer> <leader>c :s/^/\/\//<CR>gv
    autocmd FileType python,bash,ruby,ocaml
        \ vnoremap <buffer> <leader>c :s/^/#/<CR>gv
augroup end
]])
-- Highlight when yanking
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})
-- Debug Tag
vim.api.nvim_set_keymap("n", "<leader>db", ":lua InsertDebugTag()<CR>", { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<leader>db", ":lua InsertDebugTag()<CR>", { noremap = true, silent = true })

-- Define the function that inserts the debug tag based on file type
function InsertDebugTag()
	local filetype = vim.bo.filetype
	local lines

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

-- Lazy Plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)
-- Plugin Config
require("lazy").setup({
	-- Detect tabstop/shiftwidth
	"tpope/vim-sleuth",
	-- Fancy version of <leader>c vim augroup defined line 150
	{ "numToStr/Comment.nvim", opts = {} },
	{ -- In-editor git blame
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
		},
	},

	{ -- Show Keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function() -- This is the function that runs, AFTER loading
			require("which-key").setup()
			-- Document existing key chains
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
		end,
	},

	{ -- Telescope Fuzzy Finder
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				defaults = {
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
					},
					prompt_prefix = "> ",
					selection_caret = "> ",
					entry_prefix = "  ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "descending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							mirror = false,
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = { "node_modules" },
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = { "truncate" },
					winblend = 0,
					border = {},
					borderchars = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
					color_devicons = true,
					use_less = true,
					set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				},
				pickers = {
					find_files = {
						theme = "dropdown",
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
					fzf = {
						fuzzy = true,
						override_generic_sorter = true,
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
			vim.keymap.set("n", "<leader>sk", builtin.keymaps, { desc = "[S]earch [K]eymaps" })
			vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
			vim.keymap.set("n", "<leader>ss", builtin.builtin, { desc = "[S]earch [S]elect Telescope" })
			vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
			vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
			vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
			vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
			vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "[ ] Find existing buffers" })
			vim.keymap.set("n", "<leader>/", function()
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fzf current buffer" })
			vim.keymap.set("n", "<leader>s/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[S]earch [/] in Open Files" })
			vim.keymap.set("n", "<leader>sn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[S]earch [N]eovim files" })
		end,
	},

	{ -- LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			-- Automatically install LSPs and related tools to stdpath
			{ "williamboman/mason.nvim", config = true },
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			-- Status updates for LSP.
			-- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
			{ "j-hui/fidget.nvim", opts = {} },
			-- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
			-- used for completion, annotations and signatures of Neovim apis
			{ "folke/neodev.nvim", opts = {} },
		},
		config = function()
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
				callback = function(event)
					-- Define mappings specific for LSP related items. Sets the mode, buffer and description.
					local map = function(keys, func, desc)
						vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
					end
					-- Jump to the first definition of the word under your cursor.
					--  This is where a variable was first declared, or where a function is defined, etc.
					--  To jump back, press <C-t>.
					map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
					-- Find references for the word under your cursor.
					map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
					-- Jump to the implementation of the word under your cursor.
					--  Useful when your language has ways of declaring types without an actual implementation.
					map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
					-- Jump to the type of the word under your cursor.
					--  Useful when you're not sure what type a variable is and you want to see
					--  the definition of its *type*, not where it was *defined*.
					map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
					-- Fuzzy find all the symbols in your current document.
					--  Symbols are things like variables, functions, types, etc.
					map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
					-- Fuzzy find all the symbols in your current workspace.
					--  Similar to document symbols, except searches over your entire project.
					map(
						"<leader>ws",
						require("telescope.builtin").lsp_dynamic_workspace_symbols,
						"[W]orkspace [S]ymbols"
					)
					-- Rename the variable under your cursor.
					--  Most Language Servers support renaming across files, etc.
					map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
					-- Execute a code action, usually your cursor needs to be on top of an error
					-- or a suggestion from your LSP for this to activate.
					map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
					-- Opens a popup that displays documentation about the word under your cursor
					map("K", vim.lsp.buf.hover, "Hover Documentation")
					--  In C, Goto Declaration would take you to the header.
					map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
					-- The following two autocommands are used to highlight references of the
					-- word under your cursor when your cursor rests there for a little while.
					--    See `:help CursorHold` for information about when this is executed
					-- When you move your cursor, the highlights will be cleared (the second autocommand).
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.server_capabilities.documentHighlightProvider then
						local highlight_augroup =
							vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
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

					-- The following autocommand is used to enable inlay hints in your
					-- code, if the language server you are using supports them
					-- This may be unwanted, since they displace some of your code
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
					vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event.buf })
				end,
			})

			-- LSP servers and clients are able to communicate to each other what features they support.
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

			-- Enable the following language servers
			--  Add any additional override configuration in the following tables. Available keys are:
			--  - cmd (table): Override the default command used to start the server
			--  - filetypes (table): Override the default list of associated filetypes for the server
			--  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
			--  - settings (table): Override the default settings passed when initializing the server.
			--        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
			-- Add ZLS setup for Zig files
			local nvim_lsp = require("lspconfig")
			-- Define ZLS configuration
			local zls_cmd = { "zls" }
			local zls_config = {
				cmd = zls_cmd,
				filetypes = { "zig" },
				root_dir = nvim_lsp.util.root_pattern(".git"),
			}
			-- Enable ZLS
			nvim_lsp.zls.setup(zls_config)

			-- Add clangd setup for C++
			local clangd_cmd =
				{ "clangd", "--clang-tidy", "--completion-style=detailed", "--header-insertion=never", "--std=c++23" }
			local clangd_config = {
				cmd = clangd_cmd,
				filetypes = { "c", "cpp", "objc", "objcpp" },
				root_dir = require("lspconfig").util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
			}
			nvim_lsp.clangd.setup(clangd_config)
			-- Function to toggle clangd LSP features
			local clangd_enabled = true
			function ToggleClangdFeatures()
				clangd_enabled = not clangd_enabled
				local clients = vim.lsp.get_active_clients()
				for _, client in ipairs(clients) do
					if client.name == "clangd" then
						if clangd_enabled then
							client.config.capabilities.textDocument.completion =
								{ completionItem = { snippetSupport = true } }
							client.config.capabilities.textDocument.publishDiagnostics = true
							vim.diagnostic.enable()
							print("Clangd LSP features enabled")
						else
							client.config.capabilities.textDocument.completion = nil
							client.config.capabilities.textDocument.publishDiagnostics = false
							vim.diagnostic.disable()
							print("Clangd LSP features disabled")
						end
						client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
					end
				end
			end
			-- Keymap to toggle clangd LSP features
			vim.api.nvim_set_keymap(
				"n",
				"<leader>lsp",
				":lua ToggleClangdFeatures()<CR>",
				{ noremap = true, silent = true }
			)
			local servers = {
				zls = {},
				clangd = {},
				gopls = {},
				pylyzer = {},
				-- rust_analyzer = {},
				-- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
				--
				-- Some languages (like typescript) have entire language plugins that can be useful:
				--    https://github.com/pmizio/typescript-tools.nvim
				--
				-- But for many setups, the LSP (`tsserver`) will work just fine
				-- tsserver = {},
				--

				lua_ls = {
					-- cmd = {...},
					-- filetypes = { ...},
					-- capabilities = {},
					settings = {
						Lua = {
							completion = {
								callSnippet = "Replace",
							},
							-- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
							-- diagnostics = { disable = { 'missing-fields' } },
						},
					},
				},
			}

			-- Ensure the servers and tools above are installed
			--  To check the current status of installed tools and/or manually install
			--  other tools, you can run
			--    :Mason
			--;
			--  You can press `g?` for help in this menu.
			require("mason").setup()

			-- You can add other tools here that you want Mason to install
			-- for you, so that they are available from within Neovim.
			local ensure_installed = vim.tbl_keys(servers or {})
			vim.list_extend(ensure_installed, {
				"stylua", -- Used to format Lua code
			})
			require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						-- This handles overriding only values explicitly passed
						-- by the server configuration above. Useful when disabling
						-- certain features of an LSP (for example, turning off formatting for tsserver)
						server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
						require("lspconfig")[server_name].setup(server)
					end,
				},
			})
		end,
	},

	{ -- Autoformat
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = "",
				desc = "[F]ormat buffer",
			},
		},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				-- Disable "format_on_save lsp_fallback" for languages that don't
				-- have a well standardized coding style. You can add additional
				-- languages here or re-enable it for the disabled ones.
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform can also run multiple formatters sequentially
				-- python = { "isort", "black" },
				--
				-- You can use a sub-list to tell conform to run *until* a formatter
				-- is found.
				-- javascript = { { "prettierd", "prettier" } },
			},
		},
	},

	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			-- Snippet Engine & its associated nvim-cmp source
			{
				"L3MON4D3/LuaSnip",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					-- `friendly-snippets` contains a variety of premade snippets.
					--    See the README about individual language/framework/plugin snippets:
					--    https://github.com/rafamadriz/friendly-snippets
					-- {
					--   'rafamadriz/friendly-snippets',
					--   config = function()
					--     require('luasnip.loaders.from_vscode').lazy_load()
					--   end,
					-- },
				},
			},
			"saadparwaiz1/cmp_luasnip",

			-- Adds other completion capabilities.
			--  nvim-cmp does not ship with all sources by default. They are split
			--  into multiple repos for maintenance purposes.
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
		},
		config = function()
			-- See `:help cmp`
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			luasnip.config.setup({})

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				completion = { completeopt = "menu,menuone,noinsert" },

				-- For an understanding of why these mappings were
				-- chosen, you will need to read `:help ins-completion`
				--
				-- No, but seriously. Please read `:help ins-completion`, it is really good!
				mapping = cmp.mapping.preset.insert({
					-- Select the [n]ext item
					["<C-j>"] = cmp.mapping.select_next_item(),
					-- Select the [p]revious item
					["<C-k>"] = cmp.mapping.select_prev_item(),

					-- Scroll the documentation window [b]ack / [f]orward
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),

					-- Accept ([y]es) the completion.
					--  This will auto-import if your LSP supports it.
					--  This will expand snippets if the LSP sent a snippet.
					["<C-y>"] = cmp.mapping.confirm({ select = true }),

					-- If you prefer more traditional completion keymaps,
					-- you can uncomment the following lines
					--['<CR>'] = cmp.mapping.confirm { select = true },
					--['<Tab>'] = cmp.mapping.select_next_item(),
					--['<S-Tab>'] = cmp.mapping.select_prev_item(),

					-- Manually trigger a completion from nvim-cmp.
					--  Generally you don't need this, because nvim-cmp will display
					--  completions whenever it has completion options available.
					["<C-Space>"] = cmp.mapping.complete({}),

					-- Think of <c-l> as moving to the right of your snippet expansion.
					--  So if you have a snippet that's like:
					--  function $name($args)
					--    $body
					--  end
					--
					-- <c-l> will move you to the right of each of the expansion locations.
					-- <c-h> is similar, except moving you backwards.
					["<C-l>"] = cmp.mapping(function()
						luasnip.expand_or_jump()
						if luasnip.expand_or_locally_jumpable() then
						end
					end, { "i", "s" }),
					["<C-h>"] = cmp.mapping(function()
						if luasnip.locally_jumpable(-1) then
							luasnip.jump(-1)
						end
					end, { "i", "s" }),

					-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
					--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				},
			})
		end,
	},
	-- UI Config
	-- Colorschemes
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("rose-pine")
			vim.cmd.hi("Comment gui=none")
		end,
	},
	{ "folke/tokyonight.nvim" },
	-- Indentline
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			debounce = 100,
			char = "|",
			tab_char = "|",
			show_current_context = true,
			node_type = { ["*"] = { "*" } },
			remove_blankline_trail = true,
		},
		config = function()
			require("ibl").setup()
		end,
	},
	-- Highlighted TODO comments
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)  - [V]isually select [A]round [)]paren
			--  - yinq - [Y]ank [I]nside [N]ext [']quote
			--  - ci'  - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw) - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'   - [S]urround [D]elete [']quotes
			-- - sr)'  - [S]urround [R]eplace [)] [']
			require("mini.surround").setup()

			-- Simple and easy statusline.
			--  You could remove this setup call if you don't like it,
			--  and try some other statusline plugin
			local statusline = require("mini.statusline")
			-- set use_icons to true if you have a Nerd Font
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%2l:%-2v"
			end

			-- ... and there is more!
			--  Check out: https://github.com/echasnovski/mini.nvim
		end,
	},

	{
		"echasnovski/mini.indentscope",
		version = false,
		opts = {
			-- symbol = "▏",
			symbol = "│",
			options = { try_as_border = true },
		},
		init = function()
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
		end,
	},
	-- TODO: Popup CMDLINE with Noice
	{
		"folke/noice.nvim",
		opts = {
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			routes = {
				{
					filter = {
						event = "msg_show",
						any = {
							{ find = "%d+L, %d+B" },
							{ find = "; after #%d+" },
							{ find = "; before #%d+" },
						},
					},
					view = "mini",
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
				inc_rename = true,
			},
		},
    -- stylua: ignore
    keys = {
      { "<S-Enter>", function() require("noice").redirect(vim.fn.getcmdline()) end, mode = "c", desc = "Redirect Cmdline" },
      { "<leader>snl", function() require("noice").cmd("last") end, desc = "Noice Last Message" },
      { "<leader>snh", function() require("noice").cmd("history") end, desc = "Noice History" },
      { "<leader>sna", function() require("noice").cmd("all") end, desc = "Noice All" },
      { "<leader>snd", function() require("noice").cmd("dismiss") end, desc = "Dismiss All" },
      { "<c-f>", function() if not require("noice.lsp").scroll(4) then return "<c-f>" end end, silent = true, expr = true, desc = "Scroll Forward", mode = {"i", "n", "s"} },
      { "<c-b>", function() if not require("noice.lsp").scroll(-4) then return "<c-b>" end end, silent = true, expr = true, desc = "Scroll Backward", mode = {"i", "n", "s"}},
    },
		-- Popup Cmdline
		config = function()
			require("noice").setup({
				views = {
					cmdline_popup = {
						position = {
							row = 5,
							col = "50%",
						},
						size = {
							width = 60,
							height = "auto",
						},
					},
					popupmenu = {
						relative = "editor",
						position = {
							row = 8,
							col = "50%",
						},
						size = {
							width = 60,
							height = 10,
						},
						border = {
							style = "rounded",
							padding = { 0, 1 },
						},
						win_options = {
							winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
						},
					},
				},
			})
		end,
	},

	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
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
			-- Autoinstall languages that are not installed
			auto_install = true,
			highlight = {
				enable = true,
				-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
				--  If you are experiencing weird indenting issues, add the language to
				--  the list of additional_vim_regex_highlighting and disabled languages for indent.
				additional_vim_regex_highlighting = { "ruby" },
			},
			indent = { enable = true, disable = { "ruby" } },
		},
		config = function(_, opts)
			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

			-- Prefer git instead of curl in order to improve connectivity in some environments
			require("nvim-treesitter.install").prefer_git = true
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup(opts)

			-- There are additional nvim-treesitter modules that you can use to interact
			-- with nvim-treesitter. You should go explore a few and see what interests you:
			--
			--    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},

	{ -- Debugger
		"mfussenegger/nvim-dap",
		dependencies = {
			"git@github.com:leoluz/nvim-dap-go.git",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
			"nvim-neotest/nvim-nio",
			"williamboman/mason.nvim",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")
			require("dapui").setup()
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
				ui.eval(nil, { context = "hover", width = 50, height = 20, enter = true })
			end)

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end

			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end

			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end

			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
	},
}, {
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

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
