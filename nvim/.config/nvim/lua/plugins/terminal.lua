return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    event = "VeryLazy", -- load when idle
    config = function()
      -- Setup toggleterm
      require("toggleterm").setup({
        size = 15,
        open_mapping = [[<C-\>]], -- toggle terminal with Ctrl + \
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        direction = "float", -- can be "horizontal", "vertical", or "float"
        close_on_exit = true,
        shell = vim.o.shell,
        float_opts = {
          border = "curved",
          winblend = 3,
        },
      })

      -- Map <Esc> to exit terminal mode
      vim.api.nvim_set_keymap("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })

      -- Create custom terminals
      local Terminal = require("toggleterm.terminal").Terminal

      -- LazyGit (float)
      local lazygit = Terminal:new({
        cmd = "lazygit",
        hidden = true,
        direction = "float",
      })
      vim.keymap.set("n", "<leader>gg", function()
        lazygit:toggle()
      end, { desc = "Toggle LazyGit" })

      -- Node REPL (vertical)
      local node = Terminal:new({
        cmd = "node",
        hidden = true,
        direction = "float",
      })
      vim.keymap.set("n", "<leader>tn", function()
        node:toggle()
      end, { desc = "Toggle Node REPL" })
    end,
  },
}
