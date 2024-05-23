return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    'hrsh7th/cmp-nvim-lsp',
  },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
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
        "omnisharp",
        "tailwindcss",
        "rust_analyzer",
        "tsserver",
      },
      handlers = {
        function (server_name)
          require("lspconfig")[server_name].setup{
            capabilities = capabilities
          }
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup{
            settings = {
              Lua = {
                diagnostics = {
                  globals = {"vim"}
                }
              }
            }
          }
        end
      }
    })

    vim.diagnostic.config({
      virtual_text = true,
      update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}
