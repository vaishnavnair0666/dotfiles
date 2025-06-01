return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.eslint_d,
				--update this to add language formatters and diagnostics currently only lua is being formatted
				null_ls.builtins.formatting.prettierd.with({
					filetypes = { "svelte", "typescript", "javascript", "css", "scss" },
				}),
			},
		})

		vim.keymap.set("n", "<leader>bf", vim.lsp.buf.format, { desc = "buf format" })
	end,
}
