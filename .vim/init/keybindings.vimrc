" toggle file explorer
function! ToggleNERDTree()
    if &filetype == 'nerdtree'
        NERDTreeClose
    else
        NERDTreeFind
    endif
endfunction

" toggle file explorer (Cmd + b)
nnoremap <silent>  :call ToggleNERDTree()<CR> 

" change buffer (Cmd + Shift + E)
nnoremap  <C-w>w

" fuzzy find files (Cmd + p)
nnoremap  :Files<CR>

" fuzzy find by content (Cmd + Shift + f)
nnoremap  :Rg<CR>

" text search (Cmd + f)
nnoremap  /

" remove search highlight leader + Esc
nnoremap <leader><Esc> :nohlsearch<CR>:redraw!<CR>

" end of line
nnoremap 0 $
vnoremap 0 $
" start of line
nnoremap 9 0
vnoremap 9 0

" comment a line
nmap  <Plug>NERDCommenterToggle
vmap  <Plug>NERDCommenterToggle
