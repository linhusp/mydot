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
Plug 'tomasiser/vim-code-dark'
Plug 'crusoexia/vim-monokai'
" Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'itchyny/lightline.vim'
Plug 'yggdroot/indentline' " display indent characters
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " python highlighting
" Plug 'Xuyuanp/scrollbar.nvim'
if !executable('python')
    Plug 'sheerun/vim-polyglot'
endif

" }}}
" Code completion {{{

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dag/vim-fish'

" disable coc per specific type
" let g:my_coc_file_types = ['js', 'vim', 'sh', 'py']

" function! s:disable_coc_for_type()
"     if index(g:my_coc_file_types, &filetype) == -1
"         let b:coc_enabled=0
"     endif
" endfunction

" augroup CocGroup
"     autocmd!
"     autocmd BufNew,BufEnter * call s:disable_coc_for_type()
" augroup end

" if !executable('go')
"     Plug 'fatih/vim-go'
" endif

" }}}
" Files managing {{{

Plug 'preservim/nerdtree' " better sidebar
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'junegunn/fzf' " better ctrl-p
" Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-obsession' " session manager
Plug 'dhruvasagar/vim-prosession' " better vim-obsession
" Plug 'makerj/vim-pdf'
Plug 'chrisbra/csv.vim'

" }}}
" Addition Features {{{

Plug 'scrooloose/nerdcommenter' " faster commenting
Plug 'christoomey/vim-tmux-navigator'
Plug 'airblade/vim-gitgutter' " show changes since last commit
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" Plug 'godlygeek/tabular' " auto align
" Plug 'justinmk/vim-matchparenalways', {'for': ['vim', 'python', 'sh', 'javascript']}
" Plug 'iamcco/markdown-preview.nvim/', {'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Plug 'terryma/vim-smooth-scroll' " as it says
Plug 'svban/YankAssassin.vim' " dont move the cursor after yaking

" }}}
" Languages Specific {{{

if executable('python')
    Plug 'Vimjas/vim-python-pep8-indent' " cause sluggy on large files
endif

" }}}
call plug#end()
" Auto install plugins when open vim the first time {{{
if vim_plug_just_installed
    echo "Installing Bundles..."
    echo ""
    :PlugInstall
endif

" }}}
