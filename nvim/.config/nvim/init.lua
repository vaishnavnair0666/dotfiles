-- Basic options
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require("lazy").setup({
	spec = {
		{ import = "plugins" },
	},
	--install = { colorscheme = { "catppuccin" } },
	checker = { enabled = true },
})

-- Load config for plugins
--require("plugins.config.keymaps")
--require("plugins.config.treesitter")
--require("plugins.config.catppuccin")
-- Ensure Neovim sees the installed binaries
vim.env.PATH = vim.env.PATH .. ':' .. '/usr/bin'  -- Default binary path on Linux
