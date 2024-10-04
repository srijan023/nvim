return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  ft = "markdown",
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  event = {
    -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
    -- refer to `:h file-pattern` for more examples
    "BufReadPre /home/creatio/Srijan/Contents/Obsidian/Vaulter/*.md",
    "BufNewFile /home/creatio/Srijan/Contents/Obsidian/Vaulter/*.md",
  },
  dependencies = {
    -- Required.
    "nvim-lua/plenary.nvim",

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/Srijan/Contents/Obsidian/Vaulter/",
      },
      {
        name = "personal",
        path = "~/Srijan/Contents/Obsidian/Personal",
      },
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gd"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      }
    },
    completion = {
      -- Set to false to disable completion.
      nvim_cmp = true,
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "Daily Notes",
      date_format = "%a %d-%b-%Y",
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = "/home/creatio/Srijan/Contents/Obsidian/Vaulter/Templates/dailyNote.md"
    },


    templates = {
      folder = "~/Srijan/Contents/Obsidian/Vaulter/Templates",
      date_format = "%Y-%m-%d-%a",
      time_format = "%H:%M",
    }


    -- see below for full list of options 👇
  },
}
