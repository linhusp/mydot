" Theme Plugins {{{
" -------------
" Gruvbox
let g:gruvbox_contrast_dark='medium'
let g:gruvbox_termcolors=256

" Ghostshell
" let g:ghostshell_italic=1
" let g:ghostshell_italicize_comments=0

" }}}
" coc-nvim {{{
" --------
let g:coc_global_extensions=[
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-emmet',
    \ ]
" 'coc-highlight',
" 'coc-tsserver'
" 'coc-python'
" 'coc-css'
" 'coc-json'
" 'coc-html'
" 'coc-sh',
" 'coc-vimlsp',
" 'coc-pyright',

" python fstring autopairs

" jumping in snippets
let g:coc_snippet_next='<C-j>'
let g:coc_snippet_prev='<C-k>'

" <TAB> for trigger completion
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr> <S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" <CR> for trigger completion with format on type
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() :
    \ "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
    let col=col('.') - 1
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

" <C-j> and <C-k> to scroll float window
inoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(1)\<CR>" : "\<Right>"
inoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? "\<C-r>=coc#float#scroll(0)\<CR>" : "\<Left>"
nnoremap <silent><nowait><expr> <C-j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-j>"
nnoremap <silent><nowait><expr> <C-k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-k>"

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

" filetype map
let g:coc_filetype_map={
    \ 'htmldjango': 'html'
    \ }

" }}}
" NERDTree {{{
" --------
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
autocmd Bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree())
    \ | q
    \ | endif
" automatically open NERDTree when vim starts up on a opening dir
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in")
    \ | exe 'NERDTree' argv()[0] 
    \ | wincmd p
    \ | ene
    \ | exe 'cd '.argv()[0]
    \ | endif
" auto refresh
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction
autocmd BufEnter * call NERDTreeRefresh()

" }}}
" nerdtree-git-plugin {{{
" -------------------
let g:NERDTreeGitStatusIndicatorMapCustom={
    \ 'Modified': 'M',
    \ 'Staged': 'S',
    \ 'Untracked': 'U',
    \ 'Renamed': 'Rn',
    \ 'Unmerged': 'uM',
    \ 'Deleted': 'D',
    \ 'Dirty': 'd',
    \ 'Ignored': 'I',
    \ 'Clean': 'Cl',
    \ 'Unknown': '?'
    \ }
" let g:NERDTreeGitStatusShowIgnored=1
" let g:NERDTreeGitStatusConcealBrackets=1

" }}}
" NERDCommenter {{{
" -------------
let g:NERDCreateDefaultMappings=0
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
    \ 'python': {'left': '#'},
    \ }
" map 'C-/' to toggle
vmap <silent> <C-_> <Plug>NERDCommenterToggle
nmap <silent> <C-_> <Plug>NERDCommenterToggle

" }}}
"vim-tmux-navigator {{{
" -----------------
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
" ---
" toggle
nnoremap <silent> <C-p> :FZF<CR>

" }}}
" vim-go {{{
" ------
" let g:go_bin_path=$HOME."/go/bin"
" let g:go_auto_type_info=1
" let g:go_auto_sameids=1

" custom syntax highlighting
" let g:go_fold_enable = ['import']
" let g:go_highlight_extra_types=1
" let g:go_highlight_operators=1
" let g:go_highlight_functions=1
" let g:go_highlight_function_parameters=1
" let g:go_highlight_function_calls=1
" let g:go_highlight_types=1
" let g:go_highlight_format_strings=1

" }}}
" lightline {{{
" ---------
let g:lightline_gitdiff#indicator_added="+"
let g:lightline_gitdiff#indicator_deleted="-"
let g:lightline_gitdiff#indicator_modified="~"
let g:lightline_gitdiff#min_width="70"

let g:lightline={
    \ 'colorscheme': 'ghostshell'
    \ }
let g:lightline.active={
    \ 'left': [['mode', 'paste'],
    \          ['fugitive', 'currentfunction', 'filename', 'method']],
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
    \ 'right': [['coc_status']]
    \ }
let g:lightline.component_function={
    \ 'mode': 'LightlineMode',
    \ 'filename': 'LightlineFilename',
    \ 'coc_status': 'coc#status',
    \ 'currentfunction': 'CocCurrentFunction',
    \ 'fugitive': 'LightlineFugitive',
    \ 'percent': 'LightlinePercent',
    \ 'fileformat': 'LightlineFileformat',
    \ 'fileencoding': 'LightlineFileencoding',
    \ 'filetype': 'LightlineFiletype',
    \ 'blame': 'LightlineGitBlame',
    \ }
let g:lightline.component={
    \ 'lineinfo': '%3l:%-2v%<',
    \ }

function! LightlineModified()
    return &ft =~# 'help\|nerdtree' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
    return &readonly ? 'RO' : ''
endfunction

let s:viewplugins='NERD_tree'

function! LightlineFilename()
    let root=fnamemodify(get(b:, 'git_dir'), ':h')
    let path=expand('%:p')
    let fname=expand('%:t')
    return &buftype ==# 'terminal' ? ':terminal' :
        \ fname =~# 'NERD_tree' ? 'NERDTree' :
        \ (LightlineReadonly() !=# '' ? LightlineReadonly() . ' | ' : '') .
        \ (path ==# '' ? '[No Name]' : winwidth(0) < 82 ? fname :
        \  path[:len(root) - 1] ==# root ? path[len(root) + 1:] : expand('%:f')) .
        \ (LightlineModified() !=# '' ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFugitive()
    return expand('%:f') =~# s:viewplugins ? '' :
        \ &ft !~? 'vimfiler' && exists('*FugitiveHead') ? FugitiveHead() : ''
endfunction

function! LightlinePercent()
    return expand('%:t') =~# s:viewplugins ? '' : (100 * line('.') / line('$')) . '%'
endfunction

function! LightlineFileformat()
    return winwidth(0) < 82 ? '' : &fileformat
endfunction

function! LightlineFileencoding()
    return winwidth(0) < 82 ? '' : (&fenc !=# '' ? &fenc : &enc)
endfunction

function! LightlineFiletype()
    return winwidth(0) < 82 ? '' : (&ft !=# '' ? &ft : 'no ft')
endfunction

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightlineMode()
    return &ft =~# 'nerdtree' ? '' : lightline#mode()
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

let g:lightline.separator={'left': '', 'right': ''}
let g:lightline.subseparator={'left': '|', 'right': '|'}

" }}}
" GitGutter {{{
" ---------
nmap <leader>gp <Plug>(GitGutterPreviewHunk)
nmap <leader>gs <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)

" }}}
" indentLine {{{
" ----------
" let g:indentLine_color_gui='#504945'
let g:indentLine_char='¦'

" https://github.com/Yggdroot/indentLine/issues/303
let g:indentLine_bufNameExclude=['_.*', 'NERD_tree.*']
let g:indentLine_fileTypeExclude=['text', 'json']
let g:indentLine_bufTypeExclude=['help', 'terminal']

" }}}
" semshi {{{
" ------
" let g:semshi#mark_selected_nodes=0
" let g:semshi#error_sign=v:false
" let g:semshi#excluded_hl_groups=[
"     \ 'local', 'imported', 'free', 'attribute', 'unresolved', 'parameterUnused'
"     \ ]

" }}}
" vim-smooth-scroll {{{
" -----------------
if exists('smooth_scroll')
    noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
    noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
endif

" }}}
" scrollbar {{{
" ---------
" augroup scrollbar_config
"     autocmd!
"     autocmd BufEnter * silent! lua require('scrollbar').show()
"     autocmd BufLeave * silent! lua require('scrollbar').clear()

"     autocmd CursorMoved * silent! lua require('scrollbar').show()
"     autocmd VimResized * silent! lua require('scrollbar').show()

"     autocmd FocusGained * silent! lua require('scrollbar').show()
"     autocmd FocusLost * silent! lua require('scrollbar').show()
" augroup end

" let g:scrollbar_shape={
"     \ 'head': '█',
"     \ 'body': '█',
"     \ 'tail': '█',
"     \ }

" let g:scrollbar_right_offset=0

" }}}
" csv-vim {{{
" -------
let g:csv_nomap_cr=1
let g:csv_nomap_bs=1
let g:csv_nomap_space=1
" let g:csv_nomap_b=1
" }}}
