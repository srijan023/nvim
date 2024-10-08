return{
  "stevearc/conform.nvim",
  config = function ()
    require("conform").setup({
      formatters_by_ft = {
        lua = {"stylua"},
        javascript = {"prettierd"},
        html = {"prettierd"},
        css = {"prettierd"},
      },
      format_on_save = {
        lsp_fallback = true,
        timeout_ms = 500,
      },
    })
  end
}
