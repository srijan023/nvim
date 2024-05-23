return{
  "laytan/cloak.nvim",
  config = function()
    require("cloak").setup({
      enable = true,
      cloak_character = "*",
      highlighted_group = "Comment",
      patterns = {
        {
          file_pattern = {
            ".env*",
            "wranger.toml",
            ".dev.vars",
          },
          cloak_pattern = "=.+"
        },
      },
    })
  end
}
