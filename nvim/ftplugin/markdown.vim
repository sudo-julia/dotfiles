setlocal spell shiftwidth=2 tabstop=2 softtabstop=2

nnoremap <silent> <buffer> <Leader>d ddGpf ;rxA<C-r>=strftime(" <%Y-%m-%d>")<Cr><Esc>''
nnoremap <silent> <buffer> <Leader>u ddggjpfxr f<hD0
nnoremap <silent> <buffer> <Leader>n o- [ ] 
nnoremap <silent> <buffer> <Leader>N O- [ ] 
nnoremap <silent> <buffer> <Leader>a o- [ ] <!--a--><Esc>F<a
nnoremap <silent> <buffer> <Leader>A O- [ ] <!--a--><Esc>F]a
