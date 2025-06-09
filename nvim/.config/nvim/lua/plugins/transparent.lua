return {
  "xiyaowong/transparent.nvim",
  config = function()
    require("transparent").setup({
      extra_groups = {
        "Normal",
        "NormalNC",
        "NormalFloat",
        "FloatBorder",
        "TelescopeNormal",
        "TelescopeBorder",
        "NvimTreeNormal",
        "Pmenu",
      },
      exclude_groups = {}, -- Don't make these transparent
    })
    require("transparent").clear_prefix("BufferLine") -- Optional: makes BufferLine transparent
    vim.cmd("TransparentEnable")
  end,
}
