local map = require('utils').map

require('trouble').setup()

-- Lua
map("n", "<Leader>xx", "<cmd>Trouble<cr>",
  {silent = true, noremap = true}
)
map("n", "<Leader>xw", "<cmd>Trouble lsp_workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
map("n", "<Leader>xd", "<cmd>Trouble lsp_document_diagnostics<cr>",
  {silent = true, noremap = true}
)
map("n", "<Leader>xl", "<cmd>Trouble loclist<cr>",
  {silent = true, noremap = true}
)
map("n", "<Leader>xq", "<cmd>Trouble quickfix<cr>",
  {silent = true, noremap = true}
)
map("n", "gR", "<cmd>Trouble lsp_references<cr>",
  {silent = true, noremap = true}
)
