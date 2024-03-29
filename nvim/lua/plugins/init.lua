local fn = vim.fn

-- packer bootstrap
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	require("impatient")
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
	use({
		"williamboman/nvim-lsp-installer",
		requires = "neovim/nvim-lspconfig",
	})

	--- diagnostic manager
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("trouble").setup()
		end,
	})

	-- syntax
	--- faster and better code highlighting/indenting
	use({
		"nvim-treesitter/nvim-treesitter",
		config = function()
			require("plugins.treesitter")
		end,
	})

	use({ "https://tildegit.org/sloum/gemini-vim-syntax", "Xe/lolcode.vim" })

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

	--- linter and formatters
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = { "nvim-lua/plenary.nvim" },
		config = function()
			require("plugins.null-ls")
		end,
	})

	-- commenting
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})

	--- show available key bindings
	-- use({
	-- 	"folke/which-key.nvim",
	-- 	config = function()
	-- 		require("which-key").setup()
	-- 	end,
	-- })

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
		run = ":TSUpdate",
		config = function()
			require("spellsitter").setup()
		end,
	})

	use("lewis6991/impatient.nvim")

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

	--- dim inactive portions of code
	use({
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup()
		end,
	})

	--- quick statusline
	use({
		"nvim-lualine/lualine.nvim",
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

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
