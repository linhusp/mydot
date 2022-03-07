" source from vimrc
" :call mkdir(stdpath('config'), 'p')
" :exe 'edit '.stdpath('config').'/init.vim'
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" hard-code interpreter pynvim's path so that pynvim package is not required
" for each virtualenv
let g:python3_host_prog='/usr/bin/python3'

" npm neovim's path
" let g:node_host_prog='~/.npm-package/'

" python 3 support
" let g:loaded_python3_provider=1

source ~/.vim/vimrc
