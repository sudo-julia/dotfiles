require("lualine").setup({
	options = {
		padding = 1,
		component_separators = "|",
		-- section_separators = '|',
		theme = "gruvbox-flat",
	},
	-- this is pretty close to the default config, but i'm listing everything explicitly
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", { "diagnostics", sources = { "nvim_diagnostic" } } },
		lualine_c = { { "filename", path = 1 } },
		lualine_x = { "encoding", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
})
