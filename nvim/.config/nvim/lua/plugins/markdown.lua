return {
  "iamcco/markdown-preview.nvim",
  build = "cd app && npm install",
  ft = { "markdown" },
  keys = {
    { "<leader>mp", "<cmd>MarkdownPreview<CR>", desc = "Markdown Preview" },
  },
}
