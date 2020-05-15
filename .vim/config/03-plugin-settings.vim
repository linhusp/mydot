" Theme Plugins {{{
" ------------------------------------------------------------------------------
" Gruvbox
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_termcolors=256

" Ghostshell
let g:ghostshell_italic=1
let g:ghostshell_italicize_comments=0

" }}}
" coc-nvim {{{
" ------------------------------------------------------------------------------
let g:coc_global_extensions=[
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-python',
    \ 'coc-vimlsp',
    \ 'coc-highlight',
    \ 'coc-emmet'
    \ ]

" jumping in snippets
let g:coc_snippet_next='<C-j>'
let g:coc_snippet_prev='<C-k>'

" <TAB> for trigger completion
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" <CR> for trigger completion with format on type
inoremap <silent><expr> <CR>
    \ pumvisible() ? coc#_select_confirm() :
    \ "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" if has('patch8.1.1068')
"     " use 'complete_info' if the (neo)vim version supports it
"     inoremap <expr><cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
"     imap <expr><cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h ' . expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" format current window
nnoremap <silent> <leader>f :call CocAction('format')<CR>

" remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
" remap for do codeAction of current line
nmap <leader>ac <Plug>(coc-codeaction)

" fix autofix problem of current line
nmap <leader>qf <Plug>(coc-fix-current)

" create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')
" use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold', <f-args>)
" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" manage extensions
nnoremap <silent> <space>e :<C-u>CocList extensions<CR>
" show commands
nnoremap <silent> <space>c :<C-u>CocList commands<CR>

" add status line support
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" }}}
" NERDTree {{{
" ------------------------------------------------------------------------------
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeDirArrowExpandable='+'
let g:NERDTreeDirArrowCollapsible='-'
" toggle
map <silent> <C-b> :NERDTreeToggle<CR> :NERDTreeMirror<CR>
" find
map <C-f> :NERDTreeFind<CR>
" ignore
let g:NERDTreeIgnore=['^node_modules$', '^.git$', '\.swp$', '\.bak$', '\.pyc$', '^__pycache__']
" show hidden
let NERDTreeShowHidden=1
" close vim if there's only NERDTree
autocmd Bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" auto refresh
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction
autocmd BufEnter * call NERDTreeRefresh()

" }}}
" NERDCommenter {{{
" ------------------------------------------------------------------------------
" add spaces after comment delimiters
let g:NERDSpaceDelims=1 " same as g:NERDRemoveExtraSpaces=1
" use compact syntax for pretified multi-line comments
let g:NERDCompactSexyComs=1
" align line-wise comment delimiters flush left instead of following
" indentation
let g:NERDDefaultAlign='left'
" custom formats
" fix double space in python: https://github.com/preservim/nerdcommenter/issues/202
let g:NERDCustomDelimiters={
    \ 'c': {'left': '//'},
    \ 'python': {'left': '#'}
    \ }
" map 'C-/' to toggle
vmap <C-_> <Plug>NERDCommenterToggle
nmap <C-_> <Plug>NERDCommenterToggle

" }}}
"vim-tmux-navigator {{{
" ------------------------------------------------------------------------------
let g:tmux_navigator_no_mappings=1
nnoremap <silent> <A-h> :TmuxNavigateLeft<CR>
nnoremap <silent> <A-l> :TmuxNavigateRight<CR>
nnoremap <silent> <A-j> :TmuxNavigateDown<CR>
nnoremap <silent> <A-k> :TmuxNavigateUp<CR>
nnoremap <silent> <A-\> :TmuxNavigatePrevious<CR>
inoremap <silent> <A-h> <C-\><C-N>:TmuxNavigateLeft<CR>
inoremap <silent> <A-l> <C-\><C-N>:TmuxNavigateRight<CR>
inoremap <silent> <A-j> <C-\><C-N>:TmuxNavigateDown<CR>
inoremap <silent> <A-k> <C-\><C-N>:TmuxNavigateUp<CR>
inoremap <silent> <A-\> <C-\><C-N>:TmuxNavigatePrevious<CR>

" }}}
" fzf {{{
" ------------------------------------------------------------------------------
" toggle
nnoremap <silent> <C-p> :FZF<CR>

" }}}
" vim-go {{{
" ------------------------------------------------------------------------------
" let g:go_bin_path=$HOME."/go/bin"
" let g:go_auto_type_info=1
" let g:go_auto_sameids=1

" custom syntax highlighting
let g:go_fold_enable = ['import']
let g:go_highlight_extra_types=1
let g:go_highlight_operators=1
let g:go_highlight_functions=1
let g:go_highlight_function_parameters=1
let g:go_highlight_function_calls=1
let g:go_highlight_types=1
let g:go_highlight_format_strings=1

" }}}
" lightline {{{
let g:lightline_gitdiff#indicator_added="+"
let g:lightline_gitdiff#indicator_deleted="-"
let g:lightline_gitdiff#indicator_modified="~"
let g:lightline_gitdiff#min_width="70"

let g:lightline={
    \ 'colorscheme': 'ghostshell',
    \ }
let g:lightline.component={
    \ 'lineinfo': '%3l:%-2v%<'
    \ }
let g:lightline.component_function={
    \ 'coc_status': 'coc#status',
    \ 'currentfunction': 'CocCurrentFunction',
    \ 'filename': 'LightlineFilename',
    \ 'fileformat': 'LightlineFileformat',
    \ 'filetype': 'LightlineFiletype',
    \ 'blame': 'LightlineGitBlame',
    \ 'readonly': 'LightlineReadonly',
    \ 'mode': 'LightlineMode',
    \ 'fileencoding': 'LightlineFileencoding'
    \ }

function! LightlineFilename()
    let root=fnamemodify(get(b:, 'git_dir'), ':h')
    let path=expand('%:p')

    if path ==# ''
        return '[No Name]'
    endif

    if winwidth(0) >= 80
        if path[:len(root) - 1] ==# root
            return path[len(root) + 1:]
        endif
        return expand('%:f')
    else
        return expand('%:t')
    endif
endfunction

function! LightlineFileformat()
    return winwidth(0) >= 80 ? &fileformat : ''
endfunction

function! LightlineFiletype()
    return winwidth(0) >= 80 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
    return winwidth(0) >= 80 ? &fileencoding : ''
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightlineReadonly()
    return &readonly && &filetype !~# '\v(help|nerdtree)' ? 'RO' : ''
endfunction

function! LightlineMode()
    return &filetype =~# 'nerdtree' ? '' : lightline#mode()
endfunction

let g:lightline.mode_map={
    \ 'n': 'N',
    \ 'i': 'I',
    \ 'R': 'R',
    \ 'v': 'V',
    \ 'V': 'VL',
    \ "\<C-v>": 'VB',
    \ 'c': 'C',
    \ 's': 'S',
    \ 'S': 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
    \ }

let g:lightline.active={
    \ 'left': [['mode', 'paste'],
    \          ['currentfunction', 'filename', 'method', 'readonly'],
    \          ['modified']],
    \ 'right': [['lineinfo'],
    \           ['percent'],
    \           ['fileformat', 'fileencoding', 'filetype']]
    \ }
let g:lightline.inactive={
    \ 'left': [['filename']],
    \ 'right': [['lineinfo']]
    \ }
let g:lightline.tabline={
    \ 'left': [['tabs']],
    \ 'right': [['gitstatus']]
    \ }

" }}}
