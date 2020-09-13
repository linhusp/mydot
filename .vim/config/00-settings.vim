" THIS IS THE GLOBAL SETTINGS:
" To find settings for a specific language, checkout languages/*.vim

filetype indent plugin on
" Syntax: {{{
" ------------------------------------------------------------------------------
syntax on
set noshowmode
set enc=utf-8
" show hidden characters
set listchars=tab:\|.,trail:~,extends:>,precedes:<
" set listchars=tab:\|-,trail:~,eol:⏎
" set listchars=tab:▸␣,trail:~,eol:¶
set list
" enable italic manually
" set t_ZH=^[[3m
" set t_ZR=^[[23m

" }}}
" Scrolling: {{{
" ------------------------------------------------------------------------------
set scrolloff=3
" set ttyfast " default in neovim

" }}}
" Indentation: {{{
" ------------------------------------------------------------------------------
set autoindent
set expandtab " real programmers don't use tabs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4

" }}}
" Status: {{{
" ------------------------------------------------------------------------------
set laststatus=2
set showtabline=1
" set statusline=%f

" }}}
" UI: {{{
" ------------------------------------------------------------------------------
set background=dark
set number relativenumber
set signcolumn=yes
" set colorcolumn=80 " highlight max width
set wildmenu " enable enhanced mode for completion
set cursorline " highlight current line
set lazyredraw " redraw only when essentinal

" }}}
" Searching: {{{
" ------------------------------------------------------------------------------
set incsearch " incremental search
set ignorecase " make search case insensitive
set smartcase
set hlsearch " highlight search result

" }}}
" Completion: {{{
" ------------------------------------------------------------------------------
" set completeopt=menu,noinsert
set completeopt=menu
set completeopt-=preview

" }}}
" Message: {{{
" ------------------------------------------------------------------------------
" set cmdheight=2 " better display for messages
set shortmess+=ac " don't give |ins-completion-menu| messages

" }}}
" Folding: {{{
" ------------------------------------------------------------------------------
" set foldmethod=syntax

" }}}
" Terminal: {{{
" ------------------------------------------------------------------------------
autocmd TermOpen * setlocal nonumber norelativenumber signcolumn=no

" }}}
" Clipboard: {{{
" ------------------------------------------------------------------------------
" set clipboard+=unnamedplus

" }}}
" Wrap: {{{
set wrap
set linebreak " breaks by words

" }}}
" Special: {{{
" ------------------------------------------------------------------------------
set hidden " if hidden is not set, TextEdit might fail
" disable backup, some servers have issues with backup files
set nobackup
set nowritebackup
set updatetime=300 " smaller updatetime for CursorHold & CursorHoldId

" }}}
