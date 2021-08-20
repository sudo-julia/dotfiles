local map = require('utils').map

map('i', 'jk', '<Esc>')                          -- jk to escape
map('n', '<F4>', ':set hlsearch! hlsearch?<CR>') -- toggle highlights
map('n', '<F5>', ':Black<CR>')                   -- format code
map('n', 'Y', 'y$')                              -- 'Y' matches behavior of 'C', 'D'
vim.g.mapleader = ' '                            -- map leader key

-- yank buffer to clipboard
map('i', '<C-y>', "<Esc>gg'+yG:wq<CR>")
map('n', '<C-y>', "gg'+yG:wq<CR>")

-- TODO (jam) get nest working
--[[ -- switch between windows
nest.applyKeymaps {
  { '<Leader>', {
    { '<Cr', '<C-w>w' },
    { 'h', '<C-w>h' },
    { 'j', '<C-w>j' },
    { 'k', '<C-w>k' },
    { 'l', '<C-w>l' },
  }}
}
 ]]
map('n', '<Leader><Cr>', '<C-w>w')
map('n', '<Leader>h', '<C-w>h')
map('n', '<Leader>j', '<C-w>j')
map('n', '<Leader>k', '<C-w>k')
map('n', '<Leader>l', '<C-w>l')

-- terminal
map('t', '<C-[>', [[<C-\><C-n>]])

---- telescope settings
map('n', '<Leader>fb', '<Cmd>lua require("telescope.builtin").buffers()<Cr>')
map('n', '<Leader>ff', '<Cmd>lua require("telescope.builtin").find_files()<Cr>')
map('n', '<Leader>fg', '<Cmd>lua require("telescope.builtin").live_grep()<Cr>')
map('n', '<Leader>fh', '<Cmd>lua require("telescope.builtin").help_tags()<Cr>')
map('n', '<Leader>fm', '<Cmd>lua require("telescope.builtin").man_pages()<Cr>')
map('n', '<Leader>ft', '<Cmd>lua require("telescope.builtin").treesitter()<Cr>')

-- trouble settings

