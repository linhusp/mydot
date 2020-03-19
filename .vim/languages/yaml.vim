" function! HiTabs()
"     syntax match CustomTab /\t/
"     hi! link CustomTab TAB
" endfunction
" autocmd BufEnter,BufRead * call HiTabs()
autocmd FileType yaml set tabstop=2 softtabstop=2 shiftwidth=2
