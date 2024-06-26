local M = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"folke/neodev.nvim",
		},
	},
}

local function lsp_keymaps(bufnr)
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(
		bufnr,
		"n",
		"gD",
		"<cmd>lua vim.lsp.buf.declaration()<CR>",
		{ noremap = true, silent = true, desc = "[G]oto [D]eclaration" }
	)
	keymap(
		bufnr,
		"n",
		"gd",
		"<cmd>lua vim.lsp.buf.definition()<CR>",
		{ noremap = true, silent = true, desc = "[G]oto [D]efinition" }
	)

	-- keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	vim.keymap.set("n", "K", function()
		local winid = require("ufo").peekFoldedLinesUnderCursor()
		if not winid then
			vim.lsp.buf.hover()
		end
	end)
	keymap(
		bufnr,
		"n",
		"gI",
		"<cmd>lua vim.lsp.buf.implementation()<CR>",
		{ noremap = true, silent = true, desc = "[G]oto [I]mplementation" }
	)
	keymap(
		bufnr,
		"n",
		"gr",
		"<cmd>lua vim.lsp.buf.references()<CR>",
		{ noremap = true, silent = true, desc = "[G]oto [R]eferences" }
	)
	keymap(
		bufnr,
		"n",
		"gl",
		"<cmd>lua vim.diagnostic.open_float()<CR>",
		{ noremap = true, silent = true, desc = "[G]oto [L]ine Diagnostics" }
	)
	keymap(
		bufnr,
		"n",
		"gq",
		"<cmd>lua vim.diagnostic.setloclist()<cr>",
		{ noremap = true, silent = true, desc = "[G]oto [Q]uickfix" }
	)
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)

	if client.supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true, {})
	end
end

-- toggle Inlay hints on and off
M.toggle_inlay_hints = function()
	local bufnr = vim.api.nvim_get_current_buf()

	vim.lsp.inlay_hint(bufnr, nil)
end

function M.common_capabilities()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return capabilities
end

function M.config()
	local wk = require("which-key")
	wk.register({
		["<leader>la"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		["<leader>lf"] = {
			"<cmd>lua vim.lsp.buf.format({async = true, filter = function(client) return client.name ~= 'typescript-tools' end})<cr>",
			"Format",
		},
		["<leader>li"] = { "<cmd>LspInfo<cr>", "Lsp Info" },
		["<leader>lh"] = { "<cmd>lua require('user.lspsettings.lspconfig').toggle_inlay_hints()<cr>", "Toggle Hints" },
		["<leader>ll"] = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
		["<leader>lr"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
	})

	wk.register({
		["<leader>la"] = {
			name = "LSP",

			a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action", mode = "v" },
		},
	})

	local lspconfig = require("lspconfig")
	local icons = require("user.icons")

	local servers = {
		"lua_ls",
		"cssls",
		"jdtls",
		"cmake",
		"html",
		-- "tsserver",
		"emmet_ls",
		"pyright",
		"eslint",
		"bashls",
		"jsonls",
		"marksman",
		"tailwindcss",
		"clangd",
		"omnisharp",
		-- "rust_analyzer",
	}

	local default_diagnostic_config = {
		signs = {
			active = true,
			values = {
				{ name = "DiagnosticSignError", text = icons.diagnostics.Error },
				{ name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
				{ name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
				{ name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
			},
		},
		virtual_text = false,
		update_in_insert = false,
		show_diagnostic_autocmds = { "BufWrite" },
		underline = true,
		severity_sort = true,
		float = {
			focusable = true, -- this allow us to go into the floating window
			style = "minimal",
			border = "rounded",
			source = "always",
			header = "",
			prefix = "",
		},
	}

	vim.diagnostic.config(default_diagnostic_config)

	for _, sign in ipairs(vim.tbl_get(vim.diagnostic.config(), "signs", "values") or {}) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
	end

	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
	vim.lsp.handlers["textDocument/signatureHelp"] =
		vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
	require("lspconfig.ui.windows").default_options.border = "rounded"

	-- looping over the servers
	for _, server in pairs(servers) do
		-- adding onattach and capabilities
		local opts = {
			on_attach = M.on_attach, -- takes a function
			capabilities = M.common_capabilities(), -- takes object
		}

		local require_ok, settings = pcall(require, "user.lspsettings." .. server)
		if require_ok then
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		if server == "lua_ls" then
			require("neodev").setup({})
		end

		if server == "clangd" then
			opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities or {}, { offsetEncoding = { "utf-16" } })
			opts.enable_roslyn_analysers = true
			opts.enable_import_completion = true
			opts.enable_decompilation_support = true
		end

		if server == "omnisharp" then
			opts.cmd = { "/home/creatio/.local/share/nvim/mason/bin/omnisharp" }
		end

		-- if server == "rust_analyzer" then
		-- 	opts.filtypes = { "rust" }
		-- 	opts.settings = {
		-- 		["rust-analyzer"] = {
		-- 			cargo = {
		-- 				allFeature = true,
		-- 			},
		-- 		},
		-- 	}
		-- end
		lspconfig[server].setup(opts)
	end
end

return M
