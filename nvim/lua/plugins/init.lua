do
	local fn = vim.fn

	-- packer bootstrap
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({
			"git",
			"clone",
			"https://github.com/wbthomason/packer.nvim",
			install_path,
		})
		vim.api.nvim_command("packadd packer.nvim")
	end
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	-- require("impatient") -- to load in plugins faster
	use("wbthomason/packer.nvim")

	-- LSP
	--- completion plugin with snippets
	use({
		"ms-jpq/coq_nvim",
		branch = "coq",
		requires = { "ms-jpq/coq.artifacts", branch = "artifacts", opt = true },
	})

	--- lsp configurations
	use({
		"neovim/nvim-lspconfig",
		config = function()
			require("plugins.lspconfig")
		end,
	})

	--- better installer for lsps
	use({ "williamboman/nvim-lsp-installer", requires = "neovim/nvim-lspconfig" })

	--- diagnostic manager
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	})

	-- use("kosayoda/nvim-lightbulb") -- removed until the plugin author updates to the
	-- new handler signature #15504

	-- syntax
	--- faster and better code highlighting/indenting
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.treesitter")
		end,
	})

	--- easily check TODOs
	use({
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup()
		end,
	})

	--- peek lines
	use({
		"nacro90/numb.nvim",
		config = function()
			require("numb").setup()
		end,
	})

	--- manage linters
	use({
		"mfussenegger/nvim-lint",
		config = function()
			require("plugins.nvim-lint")
		end,
	})

	--- manage formatters
	use({
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.formatter")
		end,
	})

	use({ "ggandor/lightspeed.nvim", "b3nj5m1n/kommentary" })

	--- show available key bindings
	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup()
		end,
	})

	--- fuzzy finding menu
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("telescope").setup()
		end,
	})

	--- register manager
	use({
		"AckslD/nvim-neoclip.lua",
		config = function()
			require("neoclip").setup()
			require("telescope").load_extension("neoclip")
		end,
	})

	--- automatically enter project directory and more
	use({
		"ahmedkhalf/project.nvim",
		config = function()
			require("project_nvim").setup()
		end,
	})

	--- spellchecking with treesitter
	use({
		"lewis6991/spellsitter.nvim",
		requires = "nvim-treesitter/nvim-treesitter",
		config = function()
			require("spellsitter").setup()
		end,
	})

	--- faster startup, will be merged eventually
	-- use({ "lewis6991/impatient.nvim", rocks = "mpack" })

	-- looks
	--- fav colorscheme so far
	use("eddyekofo94/gruvbox-flat.nvim")

	--- highlight colors in code
	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	--- quick statusline
	use({
		"hoob3rt/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
	})

	--- file manager
	use({
		"ms-jpq/chadtree",
		branch = "chad",
		run = "python3 -m chadtree deps",
	})
end)
