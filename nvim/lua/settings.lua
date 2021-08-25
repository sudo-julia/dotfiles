local g = vim.g
local o = vim.opt
local cmd = vim.cmd
local indent = 4
--
-- quality of life settings
cmd [[highlight BadWhitespace ctermbg=red]]

-- quality of life
-- o.clipboard = 'unnamed,unamedplus'
o.backupcopy = 'yes'
o.cmdheight = 2
o.cursorcolumn = true
o.cursorline = true
o.expandtab = true
o.hidden = true
o.ignorecase = true
o.number = true
o.relativenumber = true
o.ruler = true
o.scrolloff = 2
o.shiftround = true
o.showcmd = true
o.showmatch = true
o.signcolumn = 'yes'
o.smartcase = true
o.spell = true
o.spellcapcheck = ''
o.splitbelow = true
o.splitright = true
o.textwidth = 88
o.updatetime = 300
o.wildmenu = true

-- tab settings
o.shiftwidth = indent
o.smartindent = true
o.smarttab = true
o.softtabstop = indent
o.tabstop = indent

-- colorscheme
o.termguicolors = true
g.gruvbox_italic_comments = false
g.gruvbox_italic_keywords = false
g.gruvbox_colors = {bg = '#282828'}
g.gruvbox_flat_style = 'dark'
cmd [[colorscheme gruvbox-flat]]

-- plugins
o.shortmess:append('c')
g.coq_settings = {auto_start = true}
g.python3_host_prog = '/usr/bin/python3'
