return {
  "lewis6991/gitsigns.nvim",
  -- event = "BufEnter",
  -- cmd = "Gitsigns",
  config = function()
    local icons = require("creatio.icons")
    local opts = { noremap = true, silent = true }
    vim.keymap.set(
      "n",
      "<leader>gj",
      "<cmd>lua require 'gitsigns'.next_hunk({navigation_message = false})<cr>",
      opts
    )
    vim.keymap.set(
      "n",
      "<leader>gk",
      "<cmd>lua require 'gitsigns'.prev_hunk({navigation_message = false})<cr>",
      opts
    )
    vim.keymap.set("n", "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", opts)
    vim.keymap.set("n", "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", opts)
    vim.keymap.set("n", "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", opts)
    vim.keymap.set("n", "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", opts)
    vim.keymap.set("n", "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", opts)
    vim.keymap.set("n", "<leader>go", "<cmd>Telescope git_status<cr>", opts)
    vim.keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", opts)
    vim.keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", opts)
    vim.keymap.set("n", "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", opts)
    vim.keymap.set("n", "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", opts)
    vim.keymap.set("n", "<leader>gC", "<cmd>Telescope git_b[c]ommits<cr>", opts)

    require('gitsigns').setup {
      signs                        = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged                 = {
        add          = { text = '┃' },
        change       = { text = '┃' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
      },
      signs_staged_enable          = true,
      signcolumn                   = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
      linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
      word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
      watch_gitdir                 = {
        follow_files = true
      },
      auto_attach                  = true,
      attach_to_untracked          = false,
      current_line_blame           = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts      = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
      },
      current_line_blame_formatter = '<author>, <author_time:%R> - <summary>',
      sign_priority                = 6,
      update_debounce              = 100,
      status_formatter             = nil, -- Use default
      max_file_length              = 40000, -- Disable if file is longer than this (in lines)
      preview_config               = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
      },
    }
  end,
}
