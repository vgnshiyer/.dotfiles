function! ToggleNERDTree()
    if &filetype == 'nerdtree'
        NERDTreeClose
    else
        NERDTreeFind
    endif
endfunction

nnoremap <silent>  :call ToggleNERDTree()<CR> " toggle file explorer (Cmd + b)
nnoremap  <C-w>w
nnoremap  :Files<CR>
nnoremap  :Rg<CR> " live grep files (Cmd + Shift + f)
" text search
nnoremap  /
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
