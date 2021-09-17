local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup({
	defaults = {
		mappings = {
			i = { ["<C-t>"] = trouble.open_with_trouble },
			n = { ["<C-t>"] = trouble.open_with_trouble },
		},
	},
	pickers = {
		find_files = {
			previewer = true,
		},
	},
	file_previewer = require("telescope.previewers").vim_buffer_bat.new,
})
