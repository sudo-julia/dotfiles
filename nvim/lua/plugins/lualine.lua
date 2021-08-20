require('lualine').setup {
    options = {
        padding = 1,
        component_separators = '|',
        -- section_separators = '|',
        theme = 'gruvbox-flat'
    },
    sections = {
        lualine_c = { {'filename', full_path = true} },
        lualine_x = {
            {'encoding'},
            {'fileformat', icons_enabled = false},
            {'filetype'},
        }
    },
    inactive_sections = {
        lualine_a = {  },
        lualine_b = {  },
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {  },
        lualine_z = {   }
    },
}
