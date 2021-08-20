local fn = vim.fn
local execute = vim.api.nvim_command

-- packer bootstrap
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
		execute 'packadd packer.nvim'
end

vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'

	-- LSP
	use {
		'ms-jpq/coq_nvim',
		branch = 'coq',
		requires = {
			'ms-jpq/coq.artifacts',
			branch = 'artifacts',
			opt = true
		}
	}

	use {
    'kabouzeid/nvim-lspinstall',
    event = 'BufRead'
  }

	use {
		'neovim/nvim-lspconfig',
    after = 'nvim-lspinstall',
		config = function()
			require('plugins.nvim-lspconfig')
		end
	}

	-- syntax
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

	use {
		'folke/todo-comments.nvim',
		requires = 'nvim-lua/plenary.nvim',
		config = function()
			require('todo-comments').setup()
		end
	}

	-- general
	use 'psf/black'                                            -- python code formatting
	use 'z0mbix/vim-shfmt'                                     -- bash formatting
	use 'ggandor/lightspeed.nvim'

	use {
		'nacro90/numb.nvim',
		config = function()
			require('numb').setup()
		end
	}
	use 'neomake/neomake'                                      -- linting
	use 'b3nj5m1n/kommentary'
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'} },
		config = function()
			require('telescope').setup()
		end
	}
	use 'andrejlevkovitch/vim-lua-format'                      -- lua code formatting
	use 'dbeniamine/cheat.sh-vim'                              -- cheatsheets
	use {
		'AckslD/nvim-neoclip.lua',
		config = function()
			require('neoclip').setup({
					history = 1000,
					filter = nil,
				})
		end
	}
	use {
		'ahmedkhalf/project.nvim',
		config = function()
			require("project_nvim").setup()
		end
	}

	-- looks
  use 'eddyekofo94/gruvbox-flat.nvim'

	use {
		'norcalli/nvim-colorizer.lua',
		config = function()
			require('colorizer').setup()
		end
	}

	use {
		'hoob3rt/lualine.nvim',
		config = function()
			require('plugins.lualine')
		end
	}
end)
-- manual setups
-- require('plugins.nvim-lspinstall')
-- require('plugins.tree-sitter')

-- TODO (jam) implement for snippet support in coq
-- vim.schedule(function ()
-- 	local lsp = require('lspconfig')
-- 	require('packer').loader('coq_nvim coq.artifacts')
-- 	lsp.<server>.setup(require('coq')().lsp_ensure_capabilities(<stuff>))
-- end)
