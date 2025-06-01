-- lua/plugins/which-key.lua
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	config = function()
		require("which-key").setup({
			plugins = {
				spelling = {
					enabled = true,
					suggestions = 20,
				},
			},
			window = {
				border = "rounded", -- or "single", "double", etc.
			},
		})

		-- Optional: group some of your common bindings
		local wk = require("which-key")
		wk.register({
			["<leader>f"] = { name = "+file" },
			["<leader>g"] = { name = "+git" },
			["<leader>l"] = { name = "+lsp" },
		})
	end,
}
