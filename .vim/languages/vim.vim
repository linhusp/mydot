" Disable autocomment when using <CR>
" https://vi.stackexchange.com/questions/1983/how-can-i-get-vim-to-stop-putting-comments-in-front-of-new-lines/1985#1985
autocmd FileType vim setlocal fo-=c fo-=o " fo-=r

" foldmethod
autocmd FileType vim set foldmethod=marker
