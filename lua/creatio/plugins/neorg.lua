return {
  "nvim-neorg/neorg",
  dependencies = {
    "luarocks.nvim",
  },
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.concealer"] = {},
        ["core.integrations.treesitter"] = {},
        ["core.summary"] = {},
        ["core.export"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              notes = "~/Srijan/Contents/Notes",
              inbox = "~/Srijan/Contents/Inbox",
            },
            index = "index.norg", -- name of the main (root) file
            default_workspace = "inbox",
          },
        },
        ["core.journal"] = {
          config = {
            workspace = "inbox",
          },
        },
      },
    })
  end,
}
