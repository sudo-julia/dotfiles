local cmd = vim.cmd
local create_augroup = require("utils").create_augroup

create_augroup(
  {
    { "BufNewFile,BufRead", "*.md", [[nnoremap d<C-d> ddGpf ;rXA<C-r>=strftime(" <%Y-%m-%d>")<CR><Esc>'']] },
    { "BufNewFile,BufRead", "*.md", [[nnoremap u<C-u> ddggjpfXr f<hD0]] },
    { "BufNewFile,BufRead", "*.md", [[let @n="O- [ ] "]] },
    { "BufNewFile,BufRead", "*.md", [[let @a="@n<!--a-->\<Esc>Bi"]] },
  },
"md_macros")


cmd[[au FileType help,man setlocal nospell]] -- no spellchecking help files
cmd[[highlight BadWhitespace ctermbg=12]] -- create badwhitespace group
cmd[[au BufRead,BufNewFile * match BadWhitespace /\s\+$/]] -- pt 2 of above
cmd[[au FileType bash,markdown setlocal shiftwidth=2 tabstop=2 softtabstop=2]] -- bash tab settings
cmd[[au FileType c setlocal textwidth=80 cindent cinoptions=8 sw=8 sts=8 ts=8]]
cmd[[au FileType lua setlocal shiftwidth=2 tabstop=2 softtabstop=2]] -- bash tab settings
cmd[[au FileType man nnoremap <nowait><expr><buffer> q :exit<CR>]]

-- python
--cmd[[au FileType python map <Buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>]]

cmd[[au BufRead,BufWritePre * execute ":Neomake"]] -- run neomake
cmd[[let &t_ut='']] -- draw term colors or something

-- lua
cmd[[au FileType lua nnoremap <buffer> <c-k> :call LuaFormat()<CR>]]
cmd[[au BufWrite *.lua call LuaFormat()]]

-- update packer on new plugin file
cmd("au BufWritePost " .. vim.fn.stdpath('config') .. "/plugins/init.lua source <afile> | PackerCompile")
