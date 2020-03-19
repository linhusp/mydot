" THIS IS THE GLOBAL MAPPINGS:
" For plugin mappings, checkout *-plugin-settings.vim

" Move block of codes continually
vnoremap < <gv
vnoremap > >gv

" Rebind <leader>
let g:mapleader=','

" Buffers controlling
noremap <space>t :tabnew<CR>
noremap <space>h :tabprevious<CR>
noremap <space>l :tabnext<CR>
" switch to the last used buffer
noremap <space>j <C-^>

" Disable search highlighting
nnoremap <CR> :noh<CR>

" System clipboard copy/paste
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

" Resize window
nnoremap <C-\> :vertical resize +5<CR>

" Saving
nnoremap <space>w :w<CR>
" force save as sudo
ca W!! w !sudo tee "%"

" Rename current file
function! RenameFile()
    let old_=expand('%')
    let new_=input('New file name: ', expand('%'), 'file')
    if new_ != '' && new_ != old_
        exec ':saveas ' . new_
        exec ':silent !rm ' . old_
        redraw!
    endif
endfunction
nnoremap <leader>rf :call RenameFile()<CR>

" Show highlighting groups for current word
nmap <C-S-S> :call <SID>SynStack()<CR>
function! <SID>SynStack()
    if !exists('*synstack')
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction

" Nvim's terminal
" navigate windows from any mode
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
