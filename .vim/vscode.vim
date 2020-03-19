" Plugins
" ------------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'godlygeek/tabular'

call plug#end()

" Mappings
" ------------------------------------------------------------------------------
" move block
vnoremap < <gv
vnoremap > >gv

" rebind <leader> key
let g:mapleader=','

" disable search highlighing
nnoremap <CR> :noh<CR>

" copy/paste
nnoremap <space>y "+y
nnoremap <space>d "+d
nnoremap <space>p "+p
nnoremap <space>P "+P
vnoremap <space>y "+y
vnoremap <space>d "+d
vnoremap <space>p "+p
vnoremap <space>P "+P

" quickly select text just be pasted
noremap gV `[v`]
