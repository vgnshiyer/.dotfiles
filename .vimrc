" Basic
set number
set cursorline
set showcmd
set showmatch
set ignorecase
set smartcase
set incsearch
set hlsearch
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set wrap
set linebreak
set clipboard=unnamedplus
set backspace=indent,eol,start
set clipboard=unnamed

let mapleader = ","

" pluggins
call plug#begin()
    " code plugins 
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'preservim/nerdcommenter'
    Plug 'github/copilot.vim'

    " theme pluggins
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }
    Plug 'itchyny/lightline.vim'

    " file manager
    Plug 'preservim/nerdtree'
    Plug 'Xuyuanp/nerdtree-git-plugin' 
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons'
    Plug 'airblade/vim-gitgutter'

    " file search
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

call plug#end()

" visual
" catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
colorscheme catppuccin_mocha 
let g:lightline = {'colorscheme': 'catppuccin_mocha'}
hi Normal guibg=NONE ctermbg=NONE

" interface
set wildmode=longest:full,full
set showtabline=2
set laststatus=2
set termguicolors
set noshowmode
let g:NERDSpaceDelims = 1

" performance
set lazyredraw
set updatetime=300
set ttimeout
set timeoutlen=1000 ttimeoutlen=0

" lsp-config
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)          " Go to definition
    nmap <buffer> gs <plug>(lsp-document-symbol-search) " Search document symbols
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search) " Search workspace symbols
    nmap <buffer> gr <plug>(lsp-references)          " Find references
    nmap <buffer> gi <plug>(lsp-implementation)      " Go to implementation
    nmap <buffer> gt <plug>(lsp-type-definition)     " Go to type definition
    nmap <buffer> <leader>rn <plug>(lsp-rename)      " Rename symbol
    nmap <buffer> [g <plug>(lsp-previous-diagnostic) " Go to previous diagnostic
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)     " Go to next diagnostic
    nmap <buffer> K <plug>(lsp-hover)                " Show hover information

    " Set up insert mode binding for autocomplete
    inoremap <Buffer> <C-Space> <C-x> <C-o>
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" file explorer
let NERDTreeMapActivateNode='<space>'
let NERDTreeMinimalUI=1

command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --no-ignore '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview()), <bang>0)

" Custom key bindings

" file explorer binds
nnoremap  :NERDTreeToggle<CR> " toggle file explorer (Cmd + b)
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
