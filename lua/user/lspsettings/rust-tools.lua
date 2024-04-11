local M = {
	"simrat39/rust-tools.nvim",
	ft = "rust",
	dependencies = {
		"neovim/nvim-lspconfig",
	},
}

local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.api.nvim_buf_set_keymap
	keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)

	-- keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	-- vim.keymap.set("n", "K", function()
	-- 	local winid = require("ufo").peekFoldedLinesUnderCursor()
	-- 	if not winid then
	-- 		vim.lsp.buf.hover()
	-- 	end
	-- end)
	keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

	-- Hover actions
	vim.keymap.set("n", "K", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
	-- Code action groups
	vim.keymap.set("n", "<leader>a", require("rust-tools").code_action_group.code_action_group, { buffer = bufnr })
end

function M.config()
	local lspConfig = require("user.lspsettings.lspconfig")

	local onAttach = function(client, bufnr)
		lsp_keymaps(bufnr)

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
