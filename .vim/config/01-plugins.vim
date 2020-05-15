" Auto initialize when open vim the first time {{{
let vim_plug_just_installed=0
let vim_plug_path=expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed=1
endif

" Manually load vim-plug
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" }}}

call plug#begin('~/.vim/plugged')
" Theming/Syntax highlighting {{{
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'rakr/vim-one'
Plug 'itchyny/lightline.vim'
Plug 'tomasr/molokai'
Plug 'sheerun/vim-polyglot'

" }}}
" Code completion {{{
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" }}}
" Files managing {{{
Plug 'scrooloose/nerdtree' " better sidebar
Plug 'junegunn/fzf' " better ctrl-p
Plug 'junegunn/fzf.vim'

" }}}
" Addition Features {{{
Plug 'scrooloose/nerdcommenter' " faster commenting
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter' " show changes since last commit
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'godlygeek/tabular' " auto align
" Plug 'dstein64/vim-startuptime'
Plug 'justinmk/vim-matchparenalways'

" }}}
" Languages Support {{{
" python
" Plug 'davidhalter/jedi-vim'
Plug 'hynek/vim-python-pep8-indent'

" }}}
call plug#end()

" Auto install plugins when open vim the first time {{{
if vim_plug_just_installed
    echo "Installing Bundles..."
    echo ""
    :PlugInstall
endif

" }}}
