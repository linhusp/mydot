set termguicolors

" Enable 256 colors
" if (&term=~?'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
"     let &t_Co=256
" endif

" Highlight yanked lines
" highlight HighlightedyankRegion term=bold ctermbg=214 ctermfg=239

" Highlight current word
" highlight CursorColumn cterm=none ctermbg=214 ctermfg=239

" Colorscheme:
colorscheme carbon

" Custom guicursor
set guicursor=n-v-c:block
" set guicursor+=i-ci-ve:ver25-iCursor-blinkwait175-blinkon200-blinkoff150
set guicursor+=i-ci-ve:block-blinkwait175-blinkon250-blinkoff150

" Transparent background in terminal if termguicolors is enabled
" https://github.com/vim/vim/issues/981
if !has('gui_running') && has('termguicolors')
    highlight! Normal guibg=None
else
    " if not use the default method instead
    highlight! Normal ctermbg=None
endif
