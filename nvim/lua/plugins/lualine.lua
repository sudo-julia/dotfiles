require('lualine').setup {
  options = {
    padding = 1,
    component_separators = '|',
    -- section_separators = '|',
    theme = 'gruvbox-flat'
  },
  sections = {
    lualine_c = {
      { 'diagnostics', sources = { 'nvim_lsp' } },
      { 'filename', path = 1 },
    },
    lualine_x = {
      { 'encoding' },
      { 'fileformat', icons_enabled = false },
      { 'filetype' },
    }
  },
}
