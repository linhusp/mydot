" File: ghostshell.vim
" Description: Scheme for Vim based on Ghost in the Shell series
" Author: linhusp <linh0ltv@gmail.com>
" Source: https://github.com/linusp/vim-ghostshell
" Last Modified: 1 Jan 2020
" -----------------------------------------------------------------------------
" Note: toi lam cai nay chi de cho vui :)

" Initialization: {{{
if version > 580
    hi clear
    if exists('syntax_on')
        syntax reset
    endif
endif

let g:colors_name='ghostshell'

if !(has('termguicolors') && &termguicolors) 
    \ && !has('gui_running') && &t_Co != 256
    finish
endif

" }}}
" Global: {{{

if !exists('g:ghostshell_bold')
    let g:ghostshell_bold=1
endif

if !exists('g:ghostshell_italic')
    if has('gui_running') || $TERM_ITALICS == 'true'
        let g:ghostshell_italic=1
    else
        let g:ghostshell_italic=0
    endif
endif

if !exists('g:ghostshell_undercurl')
    let g:ghostshell_undercurl=1
endif

if !exists('g:ghostshell_underline')
    let g:ghostshell_underline=1
endif

if !exists('g:ghostshell_inverse')
    let g:ghostshell_inverse=1
endif

if !exists('g:ghostshell_guisp_fallback')
    \ || index(['fg', 'bg'], g:ghostshell_guisp_fallback) == -1
    let g:ghostshell_guisp_fallback='NONE'
endif

if !exists('g:ghostshell_improved_strings')
    let g:ghostshell_improved_strings=0
endif

if !exists('g:ghostshell_improved_warnings')
    let g:ghostshell_improved_warnings=0
endif

if !exists('g:ghostshell_termcolors')
    let g:ghostshell_termcolors=256
endif

if !exists('g:ghostshell_invert_indent_guides')
    let g:ghostshell_invert_indent_guides=0
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{
" setup palette dictionary
let s:gs={}

let s:gs.dark0          = ['#282828', 235]
" let s:gs.dark0          = ['#272721', 235]
let s:gs.dark1          = ['#3c3836', 237]
let s:gs.dark2          = ['#504945', 239]
let s:gs.dark3          = ['#665c54', 241]
let s:gs.dark4          = ['#7c6f64', 243]
let s:gs.dark4_256      = ['#7c6f64', 243]

let s:gs.gray_244       = ['#928374', 244]
let s:gs.gray_245       = ['#928374', 245]

let s:gs.light0         = ['#ede4cf', 253]
let s:gs.light1         = ['#d5cfc0', 252]
let s:gs.light2         = ['#d0c2a1', 251]
let s:gs.light3         = ['#bdae93', 250]
let s:gs.light4         = ['#a89984', 248]
let s:gs.light4_256     = ['#a89984', 248]

let s:gs.neutral_red    = ['#cd4652', 160]
let s:gs.neutral_orange = ['#d79d85', 173]
let s:gs.neutral_yellow = ['#edaf88', 216]
let s:gs.neutral_green  = ['#4ec9b0', 79]
let s:gs.neutral_aqua   = ['#99d4e1', 116]
let s:gs.neutral_blue   = ['#569cd6', 67]
let s:gs.neutral_purple = ['#cba0c1', 139]

" }}}
" Emphasis: {{{
let s:bold='bold,'
if g:ghostshell_bold == 0
    let s:bold=''
endif

let s:italic='italic,'
if g:ghostshell_italic == 0
    let s:italic=''
endif

let s:underline='underline,'
if g:ghostshell_underline == 0
    let s:underline=''
endif

let s:undercurl='undercurl,'
if g:ghostshell_undercurl == 0
    let s:undercurl=''
endif

let s:inverse='inverse,'
if g:ghostshell_inverse == 0
    let s:inverse=''
endif

" }}}
" Colors: {{{
let s:bg=['bg', 'bg']
let s:fg=['fg', 'fg']
let s:none=['NONE', 'NONE']

if s:is_dark
    let s:bg0=s:gs.dark0
    let s:bg1=s:gs.dark1
    let s:bg2=s:gs.dark2
    let s:bg3=s:gs.dark3
    let s:bg4=s:gs.dark4

    let s:gray=s:gs.gray_245

    let s:fg0=s:gs.light0
    let s:fg1=s:gs.light1
    let s:fg2=s:gs.light2
    let s:fg3=s:gs.light3
    let s:fg4=s:gs.light4
    let s:fg4_256=s:gs.light4_256

    let s:red=s:gs.neutral_red
    let s:green=s:gs.neutral_green
    let s:yellow=s:gs.neutral_yellow
    let s:blue=s:gs.neutral_blue
    let s:purple=s:gs.neutral_purple
    let s:aqua=s:gs.neutral_aqua
    let s:orange=s:gs.neutral_orange
endif

" support 16 colors
if g:ghostshell_termcolors == 16
    let s:bg0[1] = 0
    let s:fg4[1] = 7
    let s:gray[1] = 8
    let s:red[1] = 9
    let s:green[1] = 10
    let s:yellow[1] = 11
    let s:blue[1] = 12
    let s:purple[1] = 13
    let s:aqua[1] = 14
    let s:fg1[1] = 15
endif

" save current colors to the palette
let s:gs.bg0=s:bg0
let s:gs.bg1=s:bg1
let s:gs.bg2=s:bg2
let s:gs.bg3=s:bg3
let s:gs.bg4=s:bg4

let s:gs.gray=s:gray

let s:gs.fg0=s:fg0
let s:gs.fg1=s:fg1
let s:gs.fg2=s:fg2
let s:gs.fg3=s:fg3
let s:gs.fg4=s:fg4
let s:gs.fg4_256=s:fg4_256

let s:gs.red=s:red
let s:gs.green=s:green
let s:gs.yellow=s:yellow
let s:gs.blue=s:blue
let s:gs.purple=s:purple
let s:gs.aqua=s:aqua
let s:gs.orange=s:orange

" }}}
" Nvim Colors: {{{
if has('nvim')
    let g:termnial_color_0=s:bg0[0]
    let g:termnial_color_8=s:gray[0]

    let g:termnial_color_1=s:gs.neutral_red[0]
    let g:termnial_color_9=s:red[0]

    let g:termnial_color_2=s:gs.neutral_green[0]
    let g:termnial_color_10=s:green[0]

    let g:termnial_color_3=s:gs.neutral_yellow[0]
    let g:termnial_color_11=s:yellow[0]

    let g:termnial_color_4=s:gs.neutral_blue[0]
    let g:termnial_color_12=s:blue[0]

    let g:termnial_color_5=s:gs.neutral_purple[0]
    let g:termnial_color_13=s:purple[0]

    let g:termnial_color_6=s:gs.neutral_aqua[0]
    let g:termnial_color_14=s:aqua[0]

    let g:termnial_color_7=s:fg4[0]
    let g:termnial_color_15=s:fg1[0]
endif

" }}}
" Overload: {{{
let s:hls_cursor=s:orange
if exists('g:ghostshell_hls_cursor')
    let s:hls_cursor=get(s:gs, g:ghostshell_hls_cursor)
endif

let s:number_column=s:none
if exists('g:ghostshell_number_column')
    let s:number_column=get(s:gs, g:ghostshell_number_column)
endif

let s:sign_column=s:none

if exists('g:gitgutter_override_sign_column_highlight')
        \ && g:gitgutter_override_sign_column_highlight == 1
    let s:sign_column=s:number_column
else
    let g:gitgutter_override_sign_column_highlight=0
    if exists('g:ghostshell_sign_column')
        let s:sign_column=get(s:gs, g:ghostshell_sign_column)
    elseif exists('g:ghostshell_enable_sign_column')
        \ && g:ghostshell_enable_sign_column == 1
        let s:sign_column=s:bg1
    endif
endif

let s:color_column=s:bg1
if exists('g:ghostshell_color_column')
    let s:color_column=get(s:gs, g:ghostshell_color_column)
endif

let s:vert_split=s:bg0
if exists('g:ghostshell_vert_split')
    let s:vert_split=get(s:gs, g:ghostshell_vert_split)
endif

let s:invert_signs=''
if exists('g:ghostshell_invert_signs')
    if g:ghostshell_invert_signs == 1
        let s:invert_signs=s:inverse
    endif
endif

let s:invert_selection=s:inverse
if exists('g:ghostshell_invert_selection')
    if g:ghostshell_invert_selection == 0
        let s:invert_selection=''
    endif
endif

let s:invert_tabline=''
if exists('g:ghostshell_invert_tabline')
    if g:ghostshell_invert_tabline == 1
        let s:invert_tabline=s:inverse
    endif
endif

let s:italicize_comments=s:italic
if exists('g:ghostshell_italicize_comments')
    if g:ghostshell_italicize_comments == 0
        let s:italicize_comments=''
    endif
endif

let s:italicize_strings=''
if exists('g:ghostshell_italicize_strings')
    if g:ghostshell_italicize_strings == 1
        let s:italicize_strings=s:italic
    endif
endif

" }}}
" Highlighting Function: {{{
function! s:HL(group, fg, ...)
    " Arguments: group, guifg, guibg, gui, guisp

    " foreground
    let fg=a:fg

    " background
    if a:0 >= 1
        let bg=a:1
    else
        let bg=s:none
    endif

    " emphasis
    if a:0 >= 2 && strlen(a:2)
        let emstr=a:2
    else
        let emstr='NONE,'
    endif

    " special fallback
    if a:0 >= 3
        if g:ghostshell_guisp_fallback != 'NONE'
            let fg=a:3
        endif

        " bg fallback mode shold invert highlighting
        if g:ghostshell_guisp_fallback == 'bg'
            let emstr .= 'inverse,'
        endif
    endif

    let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-2], 'cterm=' . emstr[:-2]
        \ ]

    " special
    if a:0 >= 3
        call add(histring, 'guisp=' . a:3[0])
    endif

    execute join(histring, ' ')
endfunction

" }}}
" Highlight Groups: {{{
" common highlight groups
call s:HL('GhostshellFg0', s:fg0)
call s:HL('GhostshellFg1', s:fg1)
call s:HL('GhostshellFg2', s:fg2)
call s:HL('GhostshellFg3', s:fg3)
call s:HL('GhostshellFg4', s:fg4)
call s:HL('GhostshellGray', s:gray)
call s:HL('GhostshellBg0', s:bg0)
call s:HL('GhostshellBg1', s:bg1)
call s:HL('GhostshellBg2', s:bg2)
call s:HL('GhostshellBg3', s:bg3)
call s:HL('GhostshellBg4', s:bg4)

call s:HL('GhostshellRed', s:red)
call s:HL('GhostshellRedBold', s:red, s:none, s:bold)
call s:HL('GhostshellGreen', s:green)
call s:HL('GhostshellGreenBold', s:green, s:none, s:bold)
call s:HL('GhostshellYellow', s:yellow)
call s:HL('GhostshellYellowBold', s:yellow, s:none, s:bold)
call s:HL('GhostshellBlue', s:blue)
call s:HL('GhostshellBlueBold', s:blue, s:none, s:bold)
call s:HL('GhostshellPurple', s:purple)
call s:HL('GhostshellPurpleBold', s:purple, s:none, s:bold)
call s:HL('GhostshellAqua', s:aqua)
call s:HL('GhostshellAquaBold', s:aqua, s:none, s:bold)
call s:HL('GhostshellOrange', s:orange)
call s:HL('GhostshellOrangeBold', s:orange, s:none, s:bold)

call s:HL('GhostshellRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('GhostshellGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('GhostshellBlueSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('GhostshellYellowSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('GhostshellPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('GhostshellAquaSign', s:aqua, s:sign_column, s:invert_signs)

" }}}

" Colorscheme:
" -----------------------------------------------------------------------------
" UI: {{{
" Text
call s:HL('Normal', s:fg1, s:bg0)

if s:is_dark
    set background=dark
endif

if version >= 700
    " Screen line that the cursor is
    call s:HL('CursorLine', s:none, s:bg1)
    " Screen column that the cursor is
    hi! link CursorColumn CursorLine

    " Tab pages line filter
    call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
    " Active tab page label
    call s:HL('TabLineSel', s:fg2, s:bg, s:invert_tabline)
    " Not active tab page label
    hi! link TabLine TabLineFill

    " Match paired bracket under the cursor
    call s:HL('MatchParen', s:yellow, s:none, s:bold . s:underline)
endif

if version >= 703
    " Highlight screen column
    call s:HL('ColorColumn', s:none, s:color_column)

    " Conceal \lambda
    call s:HL('Conceal', s:blue, s:none)

    " Line number of CursorLine
    call s:HL('CursorLineNr', s:fg1, s:bg1)
endif

hi! link NonText GhostshellBg2
hi! link SpecialKey GhostshellBg2

call s:HL('Visual', s:none, s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search', s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine', s:bg1, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names
hi! link Directory GhostshellGreenBold

" Output from :set all, :autocmd,...
call s:HL('Title', s:fg2, s:none, s:bold)

" Messages
call s:HL('ErrorMsg', s:bg0, s:red, s:bold)
" -- More --
hi! link MoreMsg GhostshellYellowBold
" Current mode
hi! link ModeMsg GhostshellYellowBold
" 'Press enter' prompt
hi! link Question GhostshellOrangeBold
" Warning
hi! link WarningMsg GhostshellRedBold

" }}}
" Gutter: {{{
" For :number and :#
call s:HL('LineNr', s:bg4, s:number_column)

call s:HL('SignColumn', s:none, s:sign_column)

" Closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Displayed folds
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{
" Normal mode cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor
hi! link vCursor Cursor
" Input mode cursor
call s:HL('iCursor', s:bg0, s:fg1)
" Language mapping
hi! link lCursor Cursor

" }}}
" Syntax: {{{
hi! link Special GhostshellFg3

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:fg, s:none, s:bold)
call s:HL('Error', s:red, s:bg, s:bold . s:inverse)

" Generic statement
hi! link Statement GhostshellBlue
" if, else,...
hi! link Conditional GhostshellBlue
" for, while,...
hi! link Repeat GhostshellBlue
" case, default,...
hi! link Label GhostshellBlue
" try, catch,...
hi! link Exception GhostshellYellow
" sizeof, '*', '+',...
hi! link Operator GhostshellBlue
" other
hi! link Keyword GhostshellBlue

hi! link Identifier GhostshellAqua

hi! link Function GhostshellPurple

" Preprocessor
hi! link PreProc GhostshellYellow
" #include,...
hi! link Include GhostshellGray
" #define,...
hi! link Define GhostshellGray
hi! link Macro GhostshellGray
" #if, #else,...
hi! link PreCondit GhostshellAqua

" Constant
hi! link Constant GhostshellYellow
hi! link Character GhostshellYellow
" hi! link SpecialChar GhostshellBlue
if g:ghostshell_improved_strings == 0
    call s:HL('String', s:orange, s:none, s:italicize_strings)
else
    call s:HL('String', s:fg1, s:none, s:italicize_strings)
endif
hi! link Boolean GhostshellBlue
" hi! link Number GhostshellGreen
hi! link Number GhostshellFg3
hi! link Float Number

" Type
hi! link Type GhostshellAqua
" static,...
hi! link StorageClass GhostshellYellow
" struct, enum,...
hi! link Structure GhostshellYellow
" typedef
hi! link Typedef GhostshellBlue

" Paren
" hi! link Delimiter Special
hi! link Delimiter GhostshellFg1

" }}}
" Completion Menu: {{{
" Popup menu normal
call s:HL('Pmenu', s:fg1, s:bg2)
" Popup menu selected
call s:HL('PmenuSel', s:bg2, s:fg2, s:bold)
" Scrollbar
call s:HL('PmenuSbar', s:none, s:bg2)
" Scrollbar thumb
call s:HL('PmenuThumb', s:none, s:bg4)

" }}}
" Diff: {{{
call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd', s:green, s:bg0, s:inverse)
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText', s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{
if has('spell')
    " Compile warning
    if g:ghostshell_improved_warnings == 0
        call s:HL('SpellCap', s:none, s:none, s:undercurl, s:red)
    else
        call s:HL('SpellCap', s:green, s:none, s:bold . s:italic)
    endif
    " Not recognized word
    call s:HL('SpellBad', s:none, s:none, s:undercurl, s:blue)
    " Wrong spelling for selected region
    call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
    " Rare word
    call s:HL('SpellRare', s:none, s:none, s:undercurl, s:purple)
endif

" }}}
" Tab: {{{
call s:HL('TAB', s:none, s:bg1)

" }}}

" Plugin:
" -----------------------------------------------------------------------------
" GitGutter: {{{
hi! link GitGutterAdd GhostshellGreenSign
hi! link GitGutterChange GhostshellAquaSign
hi! link GitGutterDelete GhostshellRedSign
hi! link GitGutterChangeDelete GhostshellAquaSign

" }}}
" NERDTree: {{{
hi! link NERDTreeDir GhostshellAqua
hi! link NERDTreeDirSlash GhostshellGray

hi! link NERDTreeOpenable GhostshellGray
hi! link NERDTreeClosable GhostshellGray

hi! link NERDTreeFile GhostshellFg1
hi! link NERDTreeExecFile GhostshellGreen

hi! link NERDTreeUp GhostshellGray
hi! link NERDTreeCWD GhostshellPurple
hi! link NERDTreeHelp GhostshellOrange

hi! link NERDTreeToggleOn GhostshellGreen
hi! link NERDTreeToggleOff GhostshellRed

" }}}
" Lightline: {{{
function! s:getColor(group)
    let guiColor=synIDattr(hlID(a:group), "fg", "gui")
    let termColor=synIDattr(hlID(a:group), "fg", "cterm")
    return [guiColor, termColor]
endfunction

if exists('g:lightline')
    let s:bg0    = s:getColor('GhostshellBg0')
    let s:bg1    = s:getColor('GhostshellBg1')
    let s:bg2    = s:getColor('GhostshellBg2')
    let s:bg4    = s:getColor('GhostshellBg4')
    let s:fg1    = s:getColor('GhostshellFg1')
    let s:fg4    = s:getColor('GhostshellFg4')

    let s:red    = s:getColor('GhostshellRed')
    let s:yellow = s:getColor('GhostshellYellow')
    let s:aqua   = s:getColor('GhostshellAqua')
    let s:orange = s:getColor('GhostshellOrange')
    let s:green  = s:getColor('GhostshellGreen')

    let s:p={
        \ 'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{}, 
        \ 'visual':{}, 'tabline':{}, 'terminal':{}
        \ }
    let s:p.normal.left     = [[s:bg0, s:fg4, 'bold'], [s:fg4, s:bg2]]
    let s:p.normal.right    = [[s:bg0, s:fg4], [s:fg4, s:bg2]]
    let s:p.normal.middle   = [[s:fg4, s:bg1]]
    let s:p.inactive.right  = [[s:bg4, s:bg1], [s:bg4, s:bg1]]
    let s:p.inactive.left   = [[s:bg4, s:bg1], [s:bg4, s:bg1]]
    let s:p.inactive.middle = [[s:bg4, s:bg1]]
    let s:p.insert.left     = [[s:bg0, s:green, 'bold'], [s:fg4, s:bg2]]
    let s:p.insert.right    = [[s:bg0, s:green], [s:fg4, s:bg2]]
    let s:p.insert.middle   = [[s:fg4, s:bg1]]
    let s:p.terminal.left     = [[s:bg0, s:aqua, 'bold'], [s:fg4, s:bg2]]
    let s:p.terminal.right    = [[s:bg0, s:aqua], [s:fg4, s:bg2]]
    let s:p.terminal.middle   = [[s:fg4, s:bg1]]
    let s:p.replace.left     = [[s:bg0, s:orange, 'bold'], [s:fg4, s:bg2]]
    let s:p.replace.right    = [[s:bg0, s:orange], [s:fg4, s:bg2]]
    let s:p.replace.middle   = [[s:fg4, s:bg1]]
    let s:p.visual.left     = [[s:bg0, s:orange, 'bold'], [s:fg4, s:bg2]]
    let s:p.visual.right    = [[s:bg0, s:orange], [s:fg4, s:bg2]]
    let s:p.visual.middle   = [[s:fg4, s:bg1]]
    let s:p.tabline.left    = [[s:fg4, s:bg2]]
    let s:p.tabline.tabsel  = [[s:bg0, s:fg4, 'bold']]
    let s:p.tabline.middle  = [[s:bg1, s:bg1]]
    let s:p.tabline.right   = [[s:bg0, s:orange]]
    let s:p.normal.error    = [[s:bg0, s:red]]
    let s:p.normal.warning  = [[s:bg2, s:yellow]]

    let g:lightline#colorscheme#ghostshell#palette=lightline#colorscheme#flatten(s:p)
endif

" }}}

" Filetype:
" -----------------------------------------------------------------------------
" Diff: {{{
hi! link diffAdded GhostshellGreen
hi! link diffRemoved GhostshellRed
hi! link diffChanged GhostshellAqua

hi! link diffFile GhostshellOrange
hi! link diffNewFile GhostshellYellow

hi! link diffLine GhostshellBlue

" }}}
" HTML: {{{
hi! link htmlTag GhostshellGray
hi! link htmlEndTag GhostshellGray
hi! link htmlScriptTag htmlTag
hi! link htmlTagName GhostshellBlue
hi! link htmlArg GhostshellAqua

hi! link htmlTagN GhostshellFg1
hi! link htmlSpecialTagName GhostshellBlueBold

call s:HL('htmlLink', s:orange, s:none, s:underline)

hi! link htmlSpecialChar GhostshellOrange

call s:HL('htmlBold', s:fg, s:bg, s:bold)
call s:HL('htmlBoldUnderline', s:fg, s:bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:fg, s:bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:fg, s:bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:fg, s:bg, s:underline)
call s:HL('htmlUnderlineItalic', s:fg, s:bg, s:underline . s:italic)
call s:HL('htmlItalic', s:fg, s:bg, s:italic)

" for django
hi! link djangoTagBlock GhostshellFg3
hi! link djangoVarBlock GhostshellYellow

" }}}
" XML: {{{
hi! link xmlTag htmlTag
hi! link xmlEndTag htmlEndTag
hi! link xmlTagName htmlTagName
hi! link xmlEqual GhostshellBlue
hi! link docbkKeyword GhostshellAquaBold

hi! link xmlDocTypeDecl GhostshellGray
hi! link xmlDocTypeKeyword GhostshellPurple
hi! link xmlCdataStart GhostshellGray
hi! link xmlCdataCdata GhostshellPurple
hi! link dtdFunction GhostshellGray
hi! link dtdTagName GhostshellPurple

hi! link xmlAttrib GhostshellAqua
hi! link xmlProcessingDelim GhostshellGray
hi! link dtdParamEntityPunct GhostshellGray
hi! link dtdParamEntityDPunct GhostshellGray
hi! link xmlAttribPunct GhostshellGray

hi! link xmlEntity GhostshellOrange
hi! link xmlEntityPunct GhostshellOrange

" }}}
" Vim: {{{
call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimFunction Function
call s:HL('vimFuncName', s:purple, s:none, s:italic)
hi! link vimUserFunc Function
hi! link vimNotation GhostshellYellow
hi! link vimBracket GhostshellYellow
hi! link vimFuncSID GhostshellYellow
hi! link vimSetSep GhostshellFg1
hi! link vimSetMod GhostshellFg1

" }}}
" C: {{{
hi! link cOperator GhostshellFg2
hi! link cStructure GhostshellBlue

" }}}
" Python: {{{
call s:HL('pythonBuiltinFunc', s:purple, s:none, s:italic)
call s:HL('pythonSelf', s:yellow, s:none, s:italic)
hi! link pythonDecorator GhostshellGray

" }}}
" CSS: {{{
call s:HL('cssFunctionName', s:purple, s:none, s:italic)
hi! link cssIdentifier GhostshellAqua
hi! link cssPseudoClassId GhostshellPurple
hi! link cssUnitDecorators GhostshellBlue
hi! link cssImportant GhostshellBlue

hi! link cssAttr GhostshellOrangeBold
hi! link cssAttrComma GhostshellFg1
hi! link cssBraces cssAttrComma
hi! link cssSelectorOp cssAttrComma
hi! link cssCustomProp GhostshellAqua

" }}}
" Javascript: {{{
hi! link jsStorageClass GhostshellBlue
hi! link jsGlobalObjects GhostshellYellow
hi! link jsOperator GhostshellBlue
hi! link jsFunction GhostshellBlue
call s:HL('jsBuiltins', s:yellow, s:none, s:italic)
hi! link jsThis GhostshellAqua

" }}}
" YAJS: {{{

" }}}
" Markdown: {{{
hi! link mkdNonListItemBlock GhostshellFg1
hi! link mkdListItemLine mkdNonListItemBlock
hi! link mkdHeading GhostshellPurpleBold
hi! link htmlH1 mkdHeading
hi! link mkdURL GhostshellFg4
hi! link mkdListItem GhostshellBlue
hi! link mkdBold GhostshellGreenBold
call s:HL('mkdItalic', s:green, s:none, s:italic)

" }}}
" Json: {{{
hi! link jsonKeyword GhostshellAqua
hi! link jsonQuote GhostshellGray
hi! link jsonBraces GhostshellFg1
hi! link jsonStrings GhostshellFg1

" }}}
" Go: {{{
hi! link goParen Delimiter
hi! link goFunctionCall Function

" }}}

" Function:
" -----------------------------------------------------------------------------
" Search Highlighting Cursor: {{{
function! GhostshellHlsShowCursor()
    call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! GhostshellHlsHideCursor()
    call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=4 ts=4 sts=4 et tw=80 ft=vim fdm=marker
