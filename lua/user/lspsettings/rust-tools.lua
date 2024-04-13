local M = {
	"simrat39/rust-tools.nvim",
	ft = "rust",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
}

local function keymaps_set(bufnr)
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

function M.config()
	local lspConfig = require("user.lspsettings.lspconfig")

	local onAttach = function(client, bufnr)
		keymaps_set(bufnr)

		if client.supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(bufnr, true)
		end
	end

	local capabilities = lspConfig.common_capabilities()
	local rt = require("rust-tools")
	rt.setup({
		server = {
			on_attach = onAttach,
			capabilities = capabilities,
		},
	})
end

return M
-- {
-- },
