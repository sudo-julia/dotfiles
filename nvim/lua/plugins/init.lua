local fn = vim.fn
local execute = vim.api.nvim_command

-- packer bootstrap
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({
    'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path
  })
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    requires = {'ms-jpq/coq.artifacts', branch = 'artifacts', opt = true}
  }

  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lspconfig') end
  }

  use {
    'kabouzeid/nvim-lspinstall',
    config = function() require('lspinstall').setup() end
  }

  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('trouble').setup() end
  }

  -- syntax
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugins.treesitter') end
  }

  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('todo-comments').setup() end
  }

  use {'nacro90/numb.nvim', config = function() require('numb').setup() end}

  use {
    'mfussenegger/nvim-lint',
    config = function()
      require('lint').linters_by_ft = {
        bash = {'shellcheck'},
        python = {'flake8', 'mypy', 'pylint'},
        lua = {'luacheck'},
        markdown = {'markdownlint'}
      }
    end
  }

  use {
    'mhartington/formatter.nvim',
    config = function() require('plugins.formatter') end
  }

  use {'ggandor/lightspeed.nvim', 'b3nj5m1n/kommentary'}

  -- use 'LionC/nest.nvim' ]]

  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup() end
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function() require('telescope').setup() end
  }

  use {
    'AckslD/nvim-neoclip.lua',
    config = function()
      require('neoclip').setup()
      require('telescope').load_extension('neoclip')
    end
  }

  use {
    'ahmedkhalf/project.nvim',
    config = function() require("project_nvim").setup() end
  }

  -- looks
  use 'eddyekofo94/gruvbox-flat.nvim'

  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }

  use {
    'hoob3rt/lualine.nvim',
    config = function() require('plugins.lualine') end
  }
end)

-- TODO: (jam) implement for snippet support in coq
-- vim.schedule(function ()
-- 	local lsp = require('lspconfig')
-- 	require('packer').loader('coq_nvim coq.artifacts')
-- 	lsp.<server>.setup(require('coq')().lsp_ensure_capabilities(<stuff>))
-- end)
