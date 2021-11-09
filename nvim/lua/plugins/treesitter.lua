require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"lua",
		"python",
	},
	highlight = {
		enable = true,
		disable = { "python", "vim" },
		-- use_languagetree = true,
	},
	incremental_selection = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
