--[[
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(e)
		local opts = { buffer = e.buf }
	end,
})
]]
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "antosha417/nvim-lsp-file-operations", config = true },
        { "folke/neodev.nvim", opts = {} },
        "hrsh7th/cmp-nvim-lsp",
        "nvim-java/nvim-java",
    },
    config = function()
        require("java").setup()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local opts = { noremap = true, silent = true }
        local on_attach = function(client, bufnr)
            -- disabling inlay hints with the server attaches
            if client.supports_method("textDocument/inlayHint") then
                vim.lsp.inlay_hint.enable(false, {})
            end

            opts.buffer = bufnr
            vim.keymap.set("n", "gd", function()
                vim.lsp.buf.definition()
            end, opts)
            vim.keymap.set("n", "K", function()
                vim.lsp.buf.hover()
            end, opts)
            vim.keymap.set("n", "<leader>vws", function()
                vim.lsp.buf.workspace_symbol()
            end, { noremap = true, silent = true, desc = "workspace symbols" })
            vim.keymap.set("n", "gl", function()
                vim.diagnostic.open_float()
            end, { silent = true, noremap = true, desc = "Line diagnostics" })

            -- might get dropped due to trouble
            vim.keymap.set("n", "]d", function()
                vim.diagnostic.jump({ count = 1, float = true })
            end, { silent = true, noremap = true, desc = "Diagnostics next" })
            vim.keymap.set("n", "[d", function()
                vim.diagnostic.jump({ count = -1, float = true })
            end, { silent = true, noremap = true, desc = "Diagnostics previous" })

            vim.keymap.set("n", "<leader>vca", function()
                vim.lsp.buf.code_action()
            end, { silent = true, noremap = true, desc = "code actions" })
            vim.keymap.set("n", "<leader>vrr", function()
                vim.lsp.buf.references()
            end, { silent = true, noremap = true, desc = "references" })
            vim.keymap.set("n", "<leader>rn", function()
                vim.lsp.buf.rename()
            end, { silent = true, noremap = true, desc = "rename" })
            vim.keymap.set("i", "<C-s>", function()
                vim.lsp.buf.signature_help()
            end, { silent = true, noremap = true, desc = "signature help" })

            -- keymap to toggle inlay hint
            vim.keymap.set("n", "<leader>hh", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            end, { noremap = true, silent = true, desc = "Toggle inlay hings" })
        end

        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {
                "bashls",
                "clangd",
                "cssls",
                "emmet_ls",
                "html",
                "jsonls",
                "lua_ls",
                "tailwindcss",
                "rust_analyzer",
                "ts_ls",
            },
            handlers = {
                function(server_name)
                    require("lspconfig")[server_name].setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                    })
                end,

                ["lua_ls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.lua_ls.setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                hint = { enable = true },
                                diagnostics = {
                                    globals = { "vim" },
                                },
                            },
                        },
                    })
                end,
                ["jdtls"] = function()
                    local lspconfig = require("lspconfig")
                    lspconfig.jdtls.setup({
                        on_attach = on_attach,
                        capabilities = capabilities,
                        settings = {
                            java = {
                                configuration = {
                                    runtimes = {
                                        name = "JavaSE-21",
                                        path = "/usr/lib/jvm/java-21-openjdk-amd64",
                                        default = true,
                                    },
                                },
                            },
                        },
                    })
                end,
            },
        })
        vim.diagnostic.config({
            virtual_text = false,
            update_in_insert = false,
            float = {
                focusable = true,
                style = "minimal",
                border = "rounded",
                source = true,
                header = "",
                prefix = "",
            },
        })
    end,
}
