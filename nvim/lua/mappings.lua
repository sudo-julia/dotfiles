local map = require("utils").map

map("i", "jk", "<Esc>") -- jk to escape
map("n", "<F4>", ":set hlsearch! hlsearch?<CR>") -- toggle highlights
map("n", "Y", "y$") -- 'Y' matches behavior of 'C', 'D'
vim.g.mapleader = " " -- map leader key

-- swtich buffers
map("n", "<Leader>bn", ":bn<Cr>")
map("n", "<Leader>bp", ":bp<Cr>")
map("n", "<Leader>bd", ":bd<Cr>")

-- yank buffer to clipboard
map("i", "<C-y>", "<Esc>gg'+yG:wq<CR>")
map("n", "<C-y>", "gg'+yG:wq<CR>")

-- switch windows
map("n", "<Leader><Cr>", "<C-w>w")
map("n", "<Leader>h", "<C-w>h")
map("n", "<Leader>j", "<C-w>j")
map("n", "<Leader>k", "<C-w>k")
map("n", "<Leader>l", "<C-w>l")

-- terminal
map("t", "<C-[>", [[<C-\><C-n>]])

---- telescope settings
map("n", "<Leader>fb", '<Cmd>lua require("telescope.builtin").buffers()<Cr>')
map("n", "<Leader>ff", '<Cmd>lua require("telescope.builtin").find_files()<Cr>')
map("n", "<Leader>fg", '<Cmd>lua require("telescope.builtin").live_grep()<Cr>')
map("n", "<Leader>fh", '<Cmd>lua require("telescope.builtin").help_tags()<Cr>')
map("n", "<Leader>fm", '<Cmd>lua require("telescope.builtin").man_pages()<Cr>')
map("n", "<Leader>ft", '<Cmd>lua require("telescope.builtin").treesitter()<Cr>')

---- formatter
map("n", "<Leader>fo", "<Cmd>Format<Cr>")

---- neoclip
map("n", "<Leader>cl", "<Cmd>Telescope neoclip<Cr>")

---- trouble settings
map("n", "<Leader>xx", "<Cmd>Trouble<Cr>")
map("n", "<Leader>xw", "<Cmd>Trouble lsp_workspace_diagnostics<Cr>")
map("n", "<Leader>xd", "<Cmd>Trouble lsp_document_diagnostics<Cr>")
map("n", "<Leader>xl", "<Cmd>Trouble loclist<Cr>")
map("n", "<Leader>xq", "<Cmd>Trouble quickfix<Cr>")
map("n", "<Leader>gR", "<Cmd>Trouble lsp_references<Cr>")

---- todo-comments
map("n", "<Leader>to", "<Cmd>TodoTelescope<Cr>")

map("n", "<Leader>wk", "<Cmd>WhichKey<Cr>")
