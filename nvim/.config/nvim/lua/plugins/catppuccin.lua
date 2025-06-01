return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "auto",
      background = {
        light = "latte",
        dark = "mocha",
      },
      transparent_background = false,
      show_end_of_buffer = false,
      term_colors = false,
      dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      },
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
      },
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        treesitter = true,
        mini = { enabled = true, indentscope_color = "" },
      },
    })

    vim.cmd.colorscheme("catppuccin")
  end,
}

