" We need nocompatible mode in order to continue lines with backslashes.
" Original setting will be restored.
let s:cpo_save = &cpo
set cpo&vim

syn keyword pythonStatement class nextgroup=pythonClass skipwhite
syn keyword pythonStatement def nextgroup=pythonFunction skipwhite
syn keyword pythonStatement break continue del
syn keyword pythonStatement assert global nonlocal
syn keyword pythonStatement pass return
syn keyword pythonStatement with as
syn keyword pythonStatement lambda

syn keyword pythonConditional if else elif
syn keyword pythonRepeat for while
syn keyword pythonException except finally raise try
syn keyword pythonInclude import from

" Async
syn keyword pythonAsync async await
syn match pythonAsync "\<async\s\+def\>" nextgroup=pythonFunction skipwhite
syn match pythonAsync "\<async\s\+with\>" display
syn match pythonAsync "\<async\s\+for\>" nextgroup=pythonRepeat skipwhite
" Self
syn keyword pythonSelf self cls

" Generators
syn match pythonInclude "\<from\>" display
syn match pythonStatement "\<yield\>" display
syn match pythonStatement "\<yield\s\+from\>" display

" Operators
syn keyword pythonExtraOperator and in is not or
syn match pythonOperator "\%(\%(<\|\<class\s\+\u\w*\s*\)\|*\|/\|+\|-\|=\|%\|\*\*\|-=\|+=\|*=\|/=\|%=\|\*\*=\)"
syn match pythonExtraOperator "\%(\%(class\s*\)\@<!<<\|<=>\|<=\|>=\|->\|\%(<\|\<class\s\+\u\w*\s*\)\@<!<[^<]\@=\|===\|==\|=\~\|>>\|=\@<!>\|\.\.\.\|\.\.\|::\|\~\|!\|^\|&\||\)"
syn match pythonExtraPseudoOperator "\%(&&=\|&=\|&&\|||=\||=\|||\|!\~\|!=\)"

" Decorators
syn match pythonDecorator "@" display nextgroup=pythonDot skipwhite

" Colons
syn match pythonColon ":"

" Class parameters
syn match pythonClass "\%(\%(class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonClassVars
syn region pythonClassVars start="(" end=")" skip=+\(".*"\|'.*'\)+ contained contains=pythonClassParameters transparent keepend
syn match pythonClassParameters "[^,]*" contained contains=pythonBoolean,pythonOperator,pythonExtraOperator,pythonBuiltinObj,pythonBuiltinFunc,pythonStatement,pythonNumber,pythonString,pythonBrackets skipwhite

" Function parameters
syn match pythonFunction "\%(\%(def\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained nextgroup=pythonFunctionVars
syn match pythonDot '\.' display nextgroup=pythonFunctionCall
syn match pythonFunctionCall '\(\.\)\@!\w*\s*\((\)\@='
syn region pythonFunctionVars start="(" end=")" skip=+\(".*"\|'.*'\)+ contained contains=pythonFunctionParameters transparent keepend
syn match pythonFunctionParameters "[^,]*" contained contains=pythonSelf,pythonBoolean,pythonOperator,pythonExtraOperator,pythonBuiltinObj,pythonBuiltinFunc,pythonStatement,pythonNumber,pythonString,pythonBrackets skipwhite

" Comment
syn match pythonComment "#.*$" contains=pythonTodo,@Spell
syn keyword pythonTodo FIXME NOTE NOTES TODO XXX contained

" Boolean
syn keyword pythonBoolean True False

" String
syn region pythonString matchgroup=pythonQuotes start=+[uU]\=\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1" contains=pythonEscape,@Spell
syn region pythonString matchgroup=pythonTripleQuotes start=+[uU]\=\z('''\|"""\)+ end="\z1" keepend contains=pythonEscape,pythonSpaceError,pythonDoctest,@Spell
syn region pythonRawString matchgroup=pythonQuotes start=+[uU]\=[rR]\z(['"]\)+ end="\z1" skip="\\\\\|\\\z1" contains=@Spell
syn region pythonRawString matchgroup=pythonTripleQuotes start=+[uU]\=[rR]\z('''\|"""\)+ end="\z1" keepend contains=pythonSpaceError,pythonDoctest,@Spell

" FString
syn region pythonFString start=+[fF]\z(['"]\)+ end='\z1' skip='\\\\\|\\\z1' keepend contains=pythonEscape,@Spell
syn region pythonFString start=+[fF]\z('''\|"""\)+ end='\z1' skip='\\\\\|\\\z1' keepend contains=pythonDoctest,@Spell

" String format
if !exists("python_no_string_format_highlight")
    syn match pythonStringFormatting "%\(([^)]\+)\)\=[-#0 +]*\d*\%(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonRawString
    syn match pythonStringFormatting "%[-#0 +]*\%(\*\|\d\+\)\=\%(\.\%(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonRawString
    syn region pythonStringFormat start="{"he=e+1,rs=e+1 end="\%(![rsa]\)\=\%(:\%({\%(\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*\|\d\+\)}\|\%([^}]\=[<>=^]\)\=[ +-]\=#\=0\=\d*,\=\%(\.\d\+\)\=[bcdeEfFgGnosxX%]\=\)\=\)\=}"hs=s-1,re=s-1 extend contained containedin=pythonFString contains=@pythonExpression
    syn match pythonStringFormatting "{}" contained containedin=pythonString,pythonRawString
endif

" String templates
if !exists("python_no_string_template_highlight")
    syn match pythonStringTemplate "\$\$" contained containedin=pythonString,pythonRawString
    syn match pythonStringTemplate "\${[a-zA-Z_][a-zA-Z0-9_]*}" contained containedin=pythonString,pythonRawString
    syn match pythonStringTemplate "\$[a-zA-Z_][a-zA-Z0-9_]*" contained containedin=pythonString,pythonRawString
endif

" Brackets
syn match pythonBrackets "[{\[(|)\]}]" skipwhite

" Escape characters
syn match pythonEscape +\\[abfnrtv'"\\]+ contained
syn match pythonEscape "\\\o\{1,3}" contained
syn match pythonEscape "\%(\\u\x\{4}\|\\U\x\{8}\)" contained
syn match pythonEscape "\\N{\a\+\%(\s\a\+\)*}" contained
syn match pythonEscape "\\$"

if exists("python_highlight_all")
    if exists("python_no_builtin_highlight")
        unlet python_no_builtin_highlight
    endif
    if exists("python_no_doctest_code_highlight")
        unlet python_no_doctest_code_highlight
    endif
    if exists("python_no_doctest_highlight")
        unlet python_no_doctest_highlight
    endif
    if exists("python_no_exception_highlight")
        unlet python_no_exception_highlight
    endif
    if exists("python_no_number_highlight")
        unlet python_no_number_highlight
    endif
    if exists("python_no_parameter_highlight")
        unlet python_no_parameter_highlight
    endif
    if exists("python_no_operator_highlight")
        unlet python_no_operator_highlight
    endif
    if exists("python_no_string_format_highlight")
        unlet python_no_string_format_highlight
    endif
    if exists("python_no_string_template_highlight")
        unlet python_no_string_template_highlight
    endif
    let python_self_cls_highlight=1
    let python_space_error_highlight=0
endif

" Float
if !exists("python_no_number_highlight")
    syn match pythonNumber "\<0[oO]\=\o\+[Ll]\=\>"
    syn match pythonNumber "\<0[xX]\x\+[Ll]\=\>"
    syn match pythonNumber "\<0[bB][01]\+[Ll]\=\>"
    syn match pythonNumber "\<\%([1-9]\d*\|0\)[Ll]\=\>"
    syn match pythonNumber "\<\d\+[jJ]\>"
    syn match pythonNumber "\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
    syn match pythonNumber
        \ "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
    syn match pythonNumber
        \ "\%(^\|\W\)\zs\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"
endif

" Built-in
if !exists("python_no_builtin_highlight")
    " builtin functions
    let s:builtin_funcs='__import__|abs|all|any|bin|callable|cmp|compile|delattr|dir|divmod|enumerate|eval|filter|exec|format|getattr|globals|locals|hasattr|hash|help|hex|id|input|intern|isinstance|issubclass|iter|len|map|max|min|range|next|oct|open|ord|pow|reduce|reload|repr|reversed|round|setattr|sorted|sum|vars|zip|print|chr|memoryview|ascii|__init__|breakpoint'
    let s:builtin_funcs='syn match pythonBuiltinFunc ''\v\.@<!\zs<%(' . s:builtin_funcs . ')>'
    let s:builtin_funcs .= '\=@!'
    execute s:builtin_funcs . ''''
    unlet s:builtin_funcs

    " builtin objects
    let s:builtin_obj='NotImplemented|Ellipsis|complex|float|int|list|slice|bool|str|dict|frozenset|set|tuple|type|object|bytes|bytearray|classmethod|staticmethod|property|super|None|__doc__|__debug__|__file__|__name__|__package__|__loader__|__spec__|__path__|__cached__'
    execute 'syn match pythonBuiltinObj ''\v\.@<!\zs<%(' . s:builtin_obj . ')>'''
    unlet s:builtin_obj
endif

" Exception
if !exists("python_no_exception_highlight")
    let s:exs='|BaseException|Exception|ArithmeticError|BufferError|LookupError|AssertionError|AttributeError|EOFError|FloatingPointError|GeneratorExit|ImportError|IOError|IndentationError|IndexError|KeyError|KeyboardInterrupt|MemoryError|NameError|NotImplementedError|OSError|OverflowError|ReferenceError|RuntimeError|StopIteration|SyntaxError|SystemError|SystemExit|TabError|UnboundLocalError|UnicodeError|UnicodeDecodeError|UnicodeEncodeError|UnicodeTranslateError|ValueError|ZeroDivisionError|Warning|UserWarning|BytesWarning|DeprecationWarning|PendingDeprecationWarning|SyntaxWarning|RuntimeWarning|FutureWarning|ImportWarning|UnicodeWarning|BlockingIOError|ChildProcessError|ConnectionError|BrokenPipeError|ConnectionAbortedError|ConnectionRefusedError|ConnectionResetError|FileExistsError|FileNotFoundError|InterruptedError|IsADirectoryError|NotADirectoryError|PermissionError|ProcessLookupError|TimeoutError|StopAsyncIteration|ResourceWarning'
    execute 'syn match pythonException ''\v\.@<!\zs<%(' . s:exs . ')>'''
    unlet s:exs
endif

if exists("python_error_highlight")
    " trailing whitespace
    syn match pythonSpaceError display excludenl "\s\+$"
    " mixted tabs and spaces
    syn match pythonSpaceError display " \+\t"
    syn match pythonSpaceError display "\t\+ "
    " indent error
    syn match pythonIndentError "^\s*\( \t\|\t \)\s*\S"me=e-1 display

    syn match pythonError "\<\d\+\D\+\>" display
    syn match pythonError "[$?]" display
    syn match pythonError "[&|]\{2,}" display
    syn match pythonError "[=]\{3,}" display
endif

if !exists("python_no_doctest_highlight")
    if !exists("python_no_doctest_code_highlight")
        syn region pythonDoctest start="^\s*>>>" skip=+\\'+ end=+'''+he=s-1 end="^\s*$" contained
    else
        syn region pythonDoctest start="^\s*>>>" end="^\s*$" contained contains=@NoSpell
    endif
endif

syn cluster pythonExpression contains=pythonStatement,pythonRepeat,pythonConditional,pythonString,pythonOperator,pythonExtraOperator,pythonExtraPseudoOperator,pythonNumber,pythonFloat,pythonBoolean,pythonFunctionCall,pythonBuiltinFunc,pythonBuiltinObj,pythonSelf

" Sync at the beginning of class, function or method definition
syn sync match pythonSync grouphere NONE "^\s*\%(def\|class\)\s\+\h\w*\s*("

" Default highlight links
hi def link pythonStatement Statement
hi def link pythonConditional Conditional
hi def link pythonRepeat Repeat
hi def link pythonOperator Operator
hi def link pythonInclude Include
hi def link pythonAsync Statement
hi def link pythonDecorator Decorators
hi def link pythonComment Comment
hi def link pythonBoolean StorageClass
hi def link pythonTodo Todo
hi def link pythonString String
hi def link pythonFString String
hi def link pythonRawString String
hi def link pythonQuotes String
hi def link pythonTripleQuotes pythonQuotes
hi def link pythonEscape Special
hi def link pythonBrackets Delimiter
hi def link pythonColon Delimiter

" Classes, Functions
hi def link pythonClass StorageClass
hi def link pythonFunction Function
hi def link pythonFunctionCall Function

if !exists("python_no_number_highlight")
    hi def link pythonNumber Number
endif
if !exists("python_no_builtin_highlight")
    hi def link pythonBuiltinFunc Function
    hi def link pythonBuiltinObj StorageClass
endif
if !exists("python_no_exception_highlight")
    hi def link pythonException Exception
endif
if exists("python_space_error_highlight")
    hi def link pythonSpaceError Error
endif
if !exists("python_no_doctest_highlight")
    hi def link pythonDoctest Comment
endif

if !exists("python_no_self_cls_highlight")
    hi def link pythonSelf StorageClass
endif
if !exists("python_no_operator_highlight")
    hi def link pythonExtraOperator Statement
    hi def link pythonExtraPseudoOperator Statement
endif
if !exists("python_no_parameter_highlight")
    hi def link pythonClassParameters Type
    hi def link pythonFunctionParameters Type
endif

if !exists("python_no_string_format_highlight")
    hi def link pythonStringFormatting Special
    hi def link pythonStringFormatParen Special
endif
if !exists("python_no_string_template_highlight")
    hi def link pythonStringTemplate Special
endif

let b:current_syntax="python"
let &cpo=s:cpo_save
unlet s:cpo_save
