require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"bash",
		"c",
		"go",
		"gomod",
		"json",
		"lua",
		"python",
		"toml",
		"vim",
		"yaml",
	},
	highlight = {
		enable = true,
		-- use_languagetree = true,
	},
	incremental_selection = {
		enable = true,
	},
	indent = {
		enable = true,
	},
})
