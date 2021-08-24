do
  local fn = vim.fn

  -- packer bootstrap
  local install_path = fn.stdpath('data') ..
                         '/site/pack/packer/start/packer.nvim'

  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path
    })
    vim.api.nvim_command('packadd packer.nvim')
  end
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- LSP
  --- completion plugin with snippets
  use {
    'ms-jpq/coq_nvim',
    branch = 'coq',
    requires = {'ms-jpq/coq.artifacts', branch = 'artifacts', opt = true}
  }

  --- lsp configurations
  use {
    'neovim/nvim-lspconfig',
    config = function() require('plugins.lspconfig') end
  }

  --- better installer for lsps
  use {'williamboman/nvim-lsp-installer', requires = 'neovim/nvim-lspconfig'}

  --- diagnostic manager
  use {
    'folke/trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require('trouble').setup() end
  }

  --- development with neovim api
  use {
    'folke/lua-dev.nvim',
    ft = {'lua'},
    config = function() require('plugins.lua-dev') end
  }

  -- syntax
  --- faster and better code highlighting/indenting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function() require('plugins.treesitter') end
  }

  --- easily check TODOs
  use {
    'folke/todo-comments.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function() require('todo-comments').setup() end
  }

  --- peek lines
  use {'nacro90/numb.nvim', config = function() require('numb').setup() end}

  -- TODO: move this to its own config file
  --- manage linters
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

  --- manage formatters
  use {
    'mhartington/formatter.nvim',
    config = function() require('plugins.formatter') end
  }

  use {'ggandor/lightspeed.nvim', 'b3nj5m1n/kommentary'}

  -- use 'LionC/nest.nvim'

  --- show available key bindings
  use {
    'folke/which-key.nvim',
    config = function() require('which-key').setup() end
  }

  --- fuzzy finding menu
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/plenary.nvim'}},
    config = function() require('telescope').setup() end
  }

  --- register manager
  use {
    'AckslD/nvim-neoclip.lua',
    config = function()
      require('neoclip').setup()
      require('telescope').load_extension('neoclip')
    end
  }

  --- automatically enter project directory and more
  use {
    'ahmedkhalf/project.nvim',
    config = function() require("project_nvim").setup() end
  }

  -- looks
  --- fav colorscheme so far
  use 'eddyekofo94/gruvbox-flat.nvim'

  --- highlight colors in code
  use {
    'norcalli/nvim-colorizer.lua',
    config = function() require('colorizer').setup() end
  }

  --- quick statusline
  use {
    'hoob3rt/lualine.nvim',
    config = function() require('plugins.lualine') end
  }
end)
