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
    "hrsh7th/cmp-nvim-lsp",
    "nvim-java/nvim-java",
  },
  config = function()
    require('java').setup()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      -- enabling inlay hints with the server attaches
      if client.supports_method("textDocument/inlayHint") then
        vim.lsp.inlay_hint.enable(true, {})
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
      end, opts)
      vim.keymap.set("n", "gl", function()
        vim.diagnostic.open_float()
      end, opts)

      -- might get dropped due to trouble
      vim.keymap.set("n", "]d", function()
        vim.diagnostic.goto_next()
      end, opts)
      vim.keymap.set("n", "[d", function()
        vim.diagnostic.goto_prev()
      end, opts)

      vim.keymap.set("n", "<leader>vca", function()
        vim.lsp.buf.code_action()
      end, opts)
      vim.keymap.set("n", "<leader>vrr", function()
        vim.lsp.buf.references()
      end, opts)
      vim.keymap.set("n", "<leader>rn", function()
        vim.lsp.buf.rename()
      end, opts)
      vim.keymap.set("i", "<C-s>", function()
        vim.lsp.buf.signature_help()
      end, opts)

      -- keymap to toggle inlay hint
      vim.keymap.set("n", "<leader>hh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, opts)
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
        "omnisharp",
        "csharp_ls",
        "tailwindcss",
        "rust_analyzer",
        "tsserver",
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
        ["omnisharp"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.omnisharp.setup({
            cmd = { "dotnet", "/home/creatio/.local/share/nvim/mason/bin/omnisharp" },

            settings = {
              FormattingOptions = {
                -- Enables support for reading code style, naming convention and analyzer
                -- settings from .editorconfig.
                EnableEditorConfigSupport = true,
                -- Specifies whether 'using' directives should be grouped and sorted during
                -- document formatting.
                OrganizeImports = nil,
              },
              MsBuild = {
                -- If true, MSBuild project system will only load projects for files that
                -- were opened in the editor. This setting is useful for big C# codebases
                -- and allows for faster initialization of code navigation features only
                -- for projects that are relevant to code that is being edited. With this
                -- setting enabled OmniSharp may load fewer projects and may thus display
                -- incomplete reference lists for symbols.
                LoadProjectsOnDemand = nil,
              },
              RoslynExtensionsOptions = {
                -- Enables support for roslyn analyzers, code fixes and rulesets.
                EnableAnalyzersSupport = nil,
                -- Enables support for showing unimported types and unimported extension
                -- methods in completion lists. When committed, the appropriate using
                -- directive will be added at the top of the current file. This option can
                -- have a negative impact on initial completion responsiveness,
                -- particularly for the first few completion sessions after opening a
                -- solution.
                EnableImportCompletion = nil,
                -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
                -- true
                AnalyzeOpenDocumentsOnly = nil,
              },
              Sdk = {
                -- Specifies whether to include preview versions of the .NET SDK when
                -- determining which version to use for project loading.
                IncludePrereleases = true,
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
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end,
}
