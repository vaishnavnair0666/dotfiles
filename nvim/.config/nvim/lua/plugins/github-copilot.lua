return {
  -- Inline suggestions
  {
    "github/copilot.vim",
    event = "InsertEnter",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_filetypes = {
        markdown = true,
        help = false,
      }

      vim.api.nvim_set_keymap("i", "<C-t>", 'copilot#Accept("<CR>")', {
        expr = true,
        silent = true,
        script = true,
      })
    end,
  },

  -- Copilot Chat (Agent Mode)
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    cmd = { "CopilotChat", "CopilotChatToggle" },
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      -- Normal mode
      { "<leader>Cc", "<cmd>CopilotChat<CR>", desc = "Copilot Chat (Agent Mode)" },
      { "<leader>Ce", "<cmd>CopilotChatExplain<CR>", desc = "Copilot: Explain Code" },
      { "<leader>Cf", "<cmd>CopilotChatFix<CR>", desc = "Copilot: Fix Code" },
      { "<leader>Ct", "<cmd>CopilotChatTests<CR>", desc = "Copilot: Generate Tests" },

      -- Visual mode support
      { "<leader>Cc", ":CopilotChatVisual<CR>", mode = "v", desc = "Copilot Chat (Visual)" },
      { "<leader>Ce", ":CopilotChatVisual Explain<CR>", mode = "v", desc = "Copilot: Explain Selection" },
      { "<leader>Cf", ":CopilotChatVisual Fix<CR>", mode = "v", desc = "Copilot: Fix Selection" },
      { "<leader>Ct", ":CopilotChatVisual Tests<CR>", mode = "v", desc = "Copilot: Test Selection" },
    },
    opts = {
      show_help = true,
      prompts = {
        Explain = "Please explain the selected code",
        Fix = "Fix the following code",
        Tests = "Write tests for this code",
      },
    },
  },
}
