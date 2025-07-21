return {
  "brenoprata10/nvim-highlight-colors",
  event = "BufReadPre",
  config = function()
    require("nvim-highlight-colors").setup({
      render = "virtual", -- or 'virtual', or 'foreground', or 'background'
      enable_named_colors = false,
      enable_tailwind = true,
    })
  end,
}
