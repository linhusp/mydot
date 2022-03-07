" File: carbon.vim
" Description: Dark scheme with colorful syntax highlighting
" Author: linhusp <linh0ltv@gmail.com>
" Source: https://github.com/linusp/carbon
" Last Modified: 14 Sep 2020
" --------------------------
" Note: toi lam cai nay chi de cho vui :)

" Initialization: {{{
if version > 580
    hi clear
    if exists('syntax_on')
        syntax reset
    endif
endif

let g:colors_name='carbon'
" enable italic by default
let g:carbon_italic=1

if !(has('termguicolors') && &termguicolors) 
    \ && !has('gui_running') && &t_Co != 256
    finish
endif

" }}}
" Global: {{{
if !exists('g:carbon_bold')
    let g:carbon_bold=1
endif

if !exists('g:carbon_italic')
    if has('gui_running') || $TERM_ITALICS == 'true'
        let g:carbon_italic=1
    else
        let g:carbon_italic=0
    endif
endif

if !exists('g:carbon_undercurl')
    let g:carbon_undercurl=1
endif

if !exists('g:carbon_underline')
    let g:carbon_underline=1
endif

if !exists('g:carbon_inverse')
    let g:carbon_inverse=1
endif

if !exists('g:carbon_guisp_fallback')
    \ || index(['fg', 'bg'], g:carbon_guisp_fallback) == -1
    let g:carbon_guisp_fallback='NONE'
endif

if !exists('g:carbon_improved_strings')
    let g:carbon_improved_strings=0
endif

if !exists('g:carbon_improved_warnings')
    let g:carbon_improved_warnings=0
endif

if !exists('g:carbon_termcolors')
    let g:carbon_termcolors=256
endif

if !exists('g:carbon_invert_indent_guides')
    let g:carbon_invert_indent_guides=0
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{
" setup palette dictionary
let s:cb={}

let s:cb.dark0          = ['#222222', 235]
let s:cb.dark1          = ['#3c3836', 237]
let s:cb.dark2          = ['#504945', 239]
let s:cb.dark3          = ['#665c54', 241]
let s:cb.dark4          = ['#7c6f64', 243]

let s:cb.gray           = ['#928374', 244]

let s:cb.light0         = ['#ede4cf', 253]
let s:cb.light1         = ['#d5cfc0', 252]
let s:cb.light2         = ['#d0c2a1', 251]
let s:cb.light3         = ['#bdae93', 250]
let s:cb.light4         = ['#a89984', 248]
let s:cb.light4_256     = ['#a89984', 248]

let s:cb.neutral_red    = ['#cd4652', 160]
let s:cb.neutral_orange = ['#d79d85', 173]
let s:cb.neutral_yellow = ['#eea66c', 216]
let s:cb.neutral_green  = ['#4ec9b0', 79]
let s:cb.neutral_aqua   = ['#99d4e1', 116]
let s:cb.neutral_blue   = ['#5396d1', 67]
let s:cb.neutral_purple = ['#cba0c1', 139]

" }}}
" Emphasis: {{{
let s:bold='bold,'
if g:carbon_bold == 0
    let s:bold=''
endif

let s:italic='italic,'
if g:carbon_italic == 0
    let s:italic=''
endif

let s:underline='underline,'
if g:carbon_underline == 0
    let s:underline=''
endif

let s:undercurl='undercurl,'
if g:carbon_undercurl == 0
    let s:undercurl=''
endif

let s:inverse='inverse,'
if g:carbon_inverse == 0
    let s:inverse=''
endif

" }}}
" Colors: {{{
let s:bg=['bg', 'bg']
let s:fg=['fg', 'fg']
let s:none=['NONE', 'NONE']

if s:is_dark
    let s:bg0=s:cb.dark0
    let s:bg1=s:cb.dark1
    let s:bg2=s:cb.dark2
    let s:bg3=s:cb.dark3
    let s:bg4=s:cb.dark4

    let s:gray=s:cb.gray

    let s:fg0=s:cb.light0
    let s:fg1=s:cb.light1
    let s:fg2=s:cb.light2
    let s:fg3=s:cb.light3
    let s:fg4=s:cb.light4

    let s:red=s:cb.neutral_red
    let s:green=s:cb.neutral_green
    let s:yellow=s:cb.neutral_yellow
    let s:blue=s:cb.neutral_blue
    let s:purple=s:cb.neutral_purple
    let s:aqua=s:cb.neutral_aqua
    let s:orange=s:cb.neutral_orange
endif

" support 16 colors
if g:carbon_termcolors == 16
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
" let s:cb.bg0=s:bg0
" let s:cb.bg1=s:bg1
" let s:cb.bg2=s:bg2
" let s:cb.bg3=s:bg3
" let s:cb.bg4=s:bg4

" let s:cb.gray=s:gray

" let s:cb.fg0=s:fg0
" let s:cb.fg1=s:fg1
" let s:cb.fg2=s:fg2
" let s:cb.fg3=s:fg3
" let s:cb.fg4=s:fg4

" let s:cb.red=s:red
" let s:cb.green=s:green
" let s:cb.yellow=s:yellow
" let s:cb.blue=s:blue
" let s:cb.purple=s:purple
" let s:cb.aqua=s:aqua
" let s:cb.orange=s:orange

" }}}
" Nvim Colors: {{{
if has('nvim')
    let g:termnial_color_0=s:bg0[0]
    let g:termnial_color_8=s:gray[0]

    let g:termnial_color_1=s:cb.neutral_red[0]
    let g:termnial_color_9=s:red[0]

    let g:termnial_color_2=s:cb.neutral_green[0]
    let g:termnial_color_10=s:green[0]

    let g:termnial_color_3=s:cb.neutral_yellow[0]
    let g:termnial_color_11=s:yellow[0]

    let g:termnial_color_4=s:cb.neutral_blue[0]
    let g:termnial_color_12=s:blue[0]

    let g:termnial_color_5=s:cb.neutral_purple[0]
    let g:termnial_color_13=s:purple[0]

    let g:termnial_color_6=s:cb.neutral_aqua[0]
    let g:termnial_color_14=s:aqua[0]

    let g:termnial_color_7=s:fg4[0]
    let g:termnial_color_15=s:fg1[0]
endif

" }}}
" Overload: {{{
let s:hls_cursor=s:orange
if exists('g:carbon_hls_cursor')
    let s:hls_cursor=get(s:cb, g:carbon_hls_cursor)
endif

let s:number_column=s:none
if exists('g:carbon_number_column')
    let s:number_column=get(s:cb, g:carbon_number_column)
endif

let s:sign_column=s:none
if exists('g:gitgutter_override_sign_column_highlight')
        \ && g:gitgutter_override_sign_column_highlight == 1
    let s:sign_column=s:number_column
else
    let g:gitgutter_override_sign_column_highlight=0

    if exists('g:carbon_sign_column')
        let s:sign_column=get(s:cb, g:carbon_sign_column)
    elseif exists('g:carbon_enable_sign_column')
        \ && g:carbon_enable_sign_column == 1
        let s:sign_column=s:bg1
    endif
endif

let s:color_column=s:bg1
if exists('g:carbon_color_column')
    let s:color_column=get(s:cb, g:carbon_color_column)
endif

let s:vert_split=s:bg1
if exists('g:carbon_vert_split')
    let s:vert_split=get(s:cb, g:carbon_vert_split)
endif

let s:invert_signs=''
if exists('g:carbon_invert_signs')
    if g:carbon_invert_signs == 1
        let s:invert_signs=s:inverse
    endif
endif

let s:invert_selection=s:inverse
if exists('g:carbon_invert_selection')
    if g:carbon_invert_selection == 0
        let s:invert_selection=''
    endif
endif

let s:invert_tabline=''
if exists('g:carbon_invert_tabline')
    if g:carbon_invert_tabline == 1
        let s:invert_tabline=s:inverse
    endif
endif

let s:italicize_comments=''
if exists('g:carbon_italicize_comments')
    if g:carbon_italicize_comments == 0
        let s:italicize_comments=''
    endif
endif

let s:italicize_strings=''
if exists('g:carbon_italicize_strings')
    if g:carbon_italicize_strings == 1
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
        if g:carbon_guisp_fallback != 'NONE'
            let fg=a:3
        endif

        " bg fallback mode shold invert highlighting
        if g:carbon_guisp_fallback == 'bg'
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
call s:HL('Fg0', s:fg0)
call s:HL('Fg1', s:fg1)
call s:HL('Fg2', s:fg2)
call s:HL('Fg3', s:fg3)
call s:HL('Fg4', s:fg4)
call s:HL('Gray', s:gray)
call s:HL('Bg0', s:bg0)
call s:HL('Bg1', s:bg1)
call s:HL('Bg2', s:bg2)
call s:HL('Bg3', s:bg3)
call s:HL('Bg4', s:bg4)

call s:HL('Red', s:red)
call s:HL('RedBold', s:red, s:none, s:bold)
call s:HL('Green', s:green)
call s:HL('GreenBold', s:green, s:none, s:bold)
call s:HL('Yellow', s:yellow)
call s:HL('YellowBold', s:yellow, s:none, s:bold)
call s:HL('Blue', s:blue)
call s:HL('BlueBold', s:blue, s:none, s:bold)
call s:HL('Purple', s:purple)
call s:HL('PurpleBold', s:purple, s:none, s:bold)
call s:HL('Aqua', s:aqua)
call s:HL('AquaBold', s:aqua, s:none, s:bold)
call s:HL('Orange', s:orange)
call s:HL('OrangeBold', s:orange, s:none, s:bold)

call s:HL('RedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('GreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('BlueSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('YellowSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('PurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('AquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('OrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}

" Colorscheme:
" ------------
" General UI: {{{
call s:HL('Normal', s:fg1, s:bg0)

if s:is_dark
    set background=dark
else
    set background=light
endif

if version >= 700
    " Current cursor's row
    call s:HL('CursorLine', s:none, s:bg1)
    " Current cursor's col
    hi! link CursorColumn CursorLine

    " Tab pages line filter
    " call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
    " Active tab page label
    " call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
    " Not active tab page label
    " hi! link TabLine TabLineFill

    " Match paired bracket under the cursor
    call s:HL('MatchParen', s:bg3, s:yellow, s:bold . s:inverse)
endif

if version >= 703
    " Highlight screen column
    call s:HL('ColorColumn', s:none, s:color_column)

    " Concealed element: \lambda → λ
    call s:HL('Conceal', s:blue, s:none)

    " Line number
    call s:HL('CursorLineNr', s:fg1, s:sign_column)
endif

hi! link NonText Bg2
hi! link SpecialKey Bg2

call s:HL('Visual', s:none, s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search', s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine', s:bg1, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

hi! link Directory AquaBold

" Output from :set all, :autocmd
call s:HL('Title', s:fg2, s:none, s:bold)

call s:HL('ErrorMsg', s:bg0, s:red, s:bold)

hi! link MoreMsg YellowBold
hi! link ModeMsg YellowBold
hi! link Question OrangeBold
hi! link WarningMsg RedBold

" }}}
" Gutter: {{{
" Line number for :number and :# commands
call s:HL('LineNr', s:bg3, s:number_column)
call s:HL('SignColumn', s:none, s:sign_column)
" Closed folds
call s:HL('Folded', s:gray, s:bg1)
" Displayed folds
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{
call s:HL('Cursor', s:none, s:none, s:inverse)
hi! link vCursor Cursor
hi! link iCursor Cursor
hi! link lCursor Cursor

" }}}
" Syntax: {{{
hi! link Special Fg3
call s:HL('Comment', s:bg4, s:none, s:italicize_comments)
call s:HL('Todo', s:fg, s:none, s:bold)
call s:HL('Error', s:red, s:bg, s:bold . s:inverse)

hi! link Statement Blue
hi! link Conditional Blue
hi! link Repeat Blue
hi! link Label Blue
hi! link Exception Yellow
hi! link Operator Blue
hi! link Keyword Blue
hi! link Identifier Aqua
hi! link Function Purple
hi! link PreProc Yellow
hi! link Include Gray
hi! link Define Gray
hi! link Macro Gray
hi! link PreCondit Aqua
hi! link Constant Yellow
hi! link Character Yellow
call s:HL('String', s:orange, s:none, s:italicize_strings)
hi! link Boolean Blue
hi! link Number Green
hi! link Float Number
hi! link Type Aqua
hi! link StorageClass Yellow
hi! link Structure Yellow
hi! link Typedef Blue
hi! link Delimiter Fg1

" }}}
" Completion Menu: {{{
if version >= 700
    " Popup menu normal
    call s:HL('Pmenu', s:fg1, s:bg2)
    " Popup menu selected
    call s:HL('PmenuSel', s:bg2, s:fg2, s:bold)
    " Scrollbar
    call s:HL('PmenuSbar', s:none, s:bg2)
    " Scrollbar thumb
    call s:HL('PmenuThumb', s:none, s:bg4)
endif

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
    if g:carbon_improved_warnings == 0
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

" Plugin:
" -------
" IndentLine: {{{
if !exists('g:indentLine_color_term')
    let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
    let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" GitGutter: {{{
hi! link GitGutterAdd GreenSign
hi! link GitGutterChange AquaSign
hi! link GitGutterDelete RedSign
hi! link GitGutterChangeDelete AquaSign

" }}}
" NERDTree: {{{
hi! link NERDTreeDir Aqua
hi! link NERDTreeDirSlash Gray

hi! link NERDTreeOpenable Gray
hi! link NERDTreeClosable Gray

hi! link NERDTreeFile Fg1
hi! link NERDTreeExecFile Green

hi! link NERDTreeUp Gray
hi! link NERDTreeCWD Purple
hi! link NERDTreeHelp Fg1

hi! link NERDTreeToggleOn Green
hi! link NERDTreeToggleOff Red

" }}}
" coc.nvim: {{{
hi! link CocErrorSign RedSign
hi! link CocWarningSign OrangeSign
hi! link CocInfoSign YellowSign
hi! link CocHintSign BlueSign
hi! link CocErrorFloat Red
hi! link CocWarningFloat Orange
hi! link CocInfoFloat Yellow
hi! link CocHintFloat Blue
hi! link CocDiagnosticsError Red
hi! link CocDiagnosticsWarning Orange
hi! link CocDiagnosticsInfo Yellow
hi! link CocDiagnosticsHint Blue

hi! link CocSelectedText Red
hi! link CocCodeLens Gray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}
" Lightline: {{{
function! s:getColor(group)
    let guiColor=synIDattr(hlID(a:group), "fg", "gui")
    let termColor=synIDattr(hlID(a:group), "fg", "cterm")
    return [guiColor, termColor]
endfunction

if exists('g:lightline')
    let s:p={
        \ 'normal':{}, 'inactive':{}, 'insert':{}, 'replace':{},
        \ 'visual':{}, 'tabline':{}, 'terminal':{}
        \ }
    let s:p.normal.left     = [[s:fg4, s:bg1, 'bold'], [s:fg4, s:bg1]]
    let s:p.normal.right    = [[s:fg4, s:bg1], [s:fg4, s:bg1], [s:fg4, s:bg1]]
    let s:p.normal.middle   = [[s:fg4, s:bg1]]
    let s:p.inactive.left   = [[s:fg4, s:bg1], [s:fg4, s:none]]
    let s:p.inactive.right  = [[s:fg4, s:bg1], [s:fg4, s:none]]
    let s:p.inactive.middle = [[s:fg4, s:bg1]]
    let s:p.insert.left     = [[s:bg0, s:fg4, 'bold'], [s:bg0, s:fg4]]
    let s:p.insert.right    = [[s:bg0, s:fg4], [s:bg0, s:fg4]]
    let s:p.insert.middle   = [[s:bg0, s:fg4]]
    let s:p.terminal.left   = [[s:bg0, s:fg4, 'bold'], [s:bg0, s:fg4]]
    let s:p.terminal.right  = [[s:bg0, s:fg4], [s:bg0, s:fg4]]
    let s:p.terminal.middle = [[s:bg0, s:fg4]]
    let s:p.replace.left    = [[s:bg0, s:fg4, 'bold'], [s:bg0, s:fg4]]
    let s:p.replace.right   = [[s:bg0, s:fg4], [s:bg0, s:fg4]]
    let s:p.replace.middle  = [[s:bg0, s:fg4]]
    let s:p.visual.left     = [[s:bg0, s:fg4, 'bold'], [s:bg0, s:fg4]]
    let s:p.visual.right    = [[s:bg0, s:fg4], [s:bg0, s:fg4]]
    let s:p.visual.middle   = [[s:bg0, s:fg4]]
    let s:p.tabline.left    = [[s:fg4, s:bg1]]
    let s:p.tabline.tabsel  = [[s:bg0, s:fg4]]
    let s:p.tabline.middle  = [[s:bg1, s:bg1]]
    let s:p.tabline.right   = [[s:fg4, s:bg1]]
    let s:p.normal.error    = [[s:bg0, s:red]]
    let s:p.normal.warning  = [[s:bg0, s:yellow]]

    let g:lightline#colorscheme#ghostshell#palette=lightline#colorscheme#flatten(s:p)
endif

" }}}
" scrollbar: {{{
let g:scrollbar_highlight={
    \ 'head': 'Fg4',
    \ 'body': 'Fg4',
    \ 'tail': 'Fg4'
    \ }

" }}}
" vim-csv: {{{
call s:HL('CSVColumnHeaderOdd', s:orange, s:none, s:bold . s:italic)
call s:HL('CSVColumnHeaderEven', s:blue, s:none, s:bold . s:italic)

" }}}

" Filetype:
" ---------
" Diff: {{{
hi! link diffAdded Green
hi! link diffRemoved Red
hi! link diffChanged Aqua
hi! link diffFile Orange
hi! link diffNewFile Yellow
hi! link diffLine Blue

" }}}
" Html: {{{
hi! link htmlTag Gray
hi! link htmlEndTag htmlTag
hi! link htmlScriptTag htmlTag
hi! link htmlTagName Blue
hi! link htmlArg Aqua
hi! link htmlTagN Fg1
hi! link htmlSpecialTagName BlueBold
call s:HL('htmlLink', s:orange, s:none, s:underline)
hi! link htmlSpecialChar Orange
call s:HL('htmlBold', s:fg, s:bg, s:bold)
call s:HL('htmlBoldUnderline', s:fg, s:bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:fg, s:bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:fg, s:bg, s:bold . s:underline . s:italic)
call s:HL('htmlUnderline', s:fg, s:bg, s:underline)
call s:HL('htmlUnderlineItalic', s:fg, s:bg, s:underline . s:italic)
call s:HL('htmlItalic', s:fg, s:bg, s:italic)

" }}}
" Xml: {{{
hi! link xmlTag htmlTag
hi! link xmlEndTag htmlEndTag
hi! link xmlTagName htmlTagName
hi! link xmlEqual Blue
hi! link docbkKeyword AquaBold
hi! link xmlDocTypeDecl Gray
hi! link xmlDocTypeKeyword Purple
hi! link xmlCdataStart Gray
hi! link xmlCdataCdata Purple
hi! link dtdFunction Gray
hi! link dtdTagName Purple
hi! link xmlAttrib Aqua
hi! link xmlProcessingDelim Gray
hi! link dtdParamEntityPunct Gray
hi! link dtdParamEntityDPunct Gray
hi! link xmlAttribPunct Gray
hi! link xmlEntity Orange
hi! link xmlEntityPunct Orange

" }}}
" Vim: {{{
call s:HL('vimCommentTitle', s:fg4, s:none, s:bold . s:italicize_comments)

hi! link vimFunction Function
call s:HL('vimFuncName', s:purple, s:none, s:italic)
hi! link vimUserFunc Function
hi! link vimNotation Yellow
hi! link vimBracket Yellow
hi! link vimFuncSID Yellow
hi! link vimSetSep Fg1
hi! link vimSetMod Fg1
hi! link vimPatSep Gray

" }}}
" C: {{{
hi! link cOperator Fg2
hi! link cStructure Blue

" }}}
" Python: {{{
call s:HL('pythonBuiltinFunc', s:purple, s:none, s:italic)
hi! link pythonInput pythonBuiltinFunc
hi! link pythonSelf Gray
hi! link pythonDecorator Gray

" }}}
" CSS: {{{
call s:HL('cssFunctionName', s:purple, s:none, s:italic)
hi! link cssIdentifier Aqua
hi! link cssPseudoClassId Purple
hi! link cssUnitDecorators Blue
hi! link cssImportant Blue

hi! link cssAttr OrangeBold
hi! link cssAttrComma Fg1
hi! link cssBraces cssAttrComma
hi! link cssSelectorOp cssAttrComma
hi! link cssCustomProp Aqua

" }}}
" Javascript: {{{
hi! link jsStorageClass Blue
hi! link jsGlobalObjects Yellow
hi! link jsOperator Blue
hi! link jsFunction Blue
call s:HL('jsBuiltins', s:yellow, s:none, s:italic)
hi! link jsThis Aqua

" }}}
" YAJS: {{{

" }}}
" Markdown: {{{
hi! link mkdNonListItemBlock Fg1
hi! link mkdListItemLine mkdNonListItemBlock
hi! link mkdHeading PurpleBold
hi! link htmlH1 mkdHeading
hi! link mkdURL Fg4
hi! link mkdListItem Blue
hi! link mkdBold GreenBold
call s:HL('mkdItalic', s:green, s:none, s:italic)

" }}}
" Json: {{{
hi! link jsonKeyword Aqua
hi! link jsonQuote Gray
hi! link jsonBraces Fg1
hi! link jsonStrings Fg1

" }}}
" Go: {{{
hi! link goParen Delimiter
hi! link goFunctionCall Function

" }}}

" Function:
" ---------
" Search Highlighting Cursor: {{{
function! CarbonHlsShowCursor()
    call s:HL('Cursor', s:bg0, s:hls_cursor)
endfunction

function! CarbonHlsHideCursor()
    call s:HL('Cursor', s:none, s:none, s:inverse)
endfunction

" }}}

" vim: set sw=4 ts=4 sts=4 et tw=80 ft=vim fdm=marker
