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
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-html',
    \ 'coc-css',
    \ 'coc-yaml',
    \ '@yaegassy/coc-pylsp',
    \ 'coc-vetur',
    \ 'coc-rls',
    \ 'coc-snippets',
    \ 'coc-highlight',
    \ 'coc-explorer',
    \ 'coc-prettier',
    \ 'coc-eslint',
    \ 'coc-git',
    \ 'coc-rust-analyzer',
    \ 'coc-vimlsp',
    \ ]

" tab to trigger completion
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" file explorer
let NERDTreeMapActivateNode='<space>'
let NERDTreeMinimalUI=1

command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \   'rg --column --line-number --no-heading --color=always --smart-case --no-ignore '.shellescape(<q-args>), 1,
    \   fzf#vim#with_preview(), <bang>0)

" Custom key bindings
" file explorer binds
function! ToggleNERDTree()
    if &filetype == 'nerdtree'
        NERDTreeClose
    else
        NERDTreeFind
    endif
endfunction

nnoremap <silent> <F3> :call ToggleNERDTree()<CR> " toggle file explorer (Cmd + b)
nnoremap <F2> <C-w>w
" open files (Cmd + p)
nnoremap <F4> :Files<CR>
" live grep files (Cmd + Shift + f)
nnoremap <F5> :Rg<CR>
" text search
nnoremap <F6> /
nnoremap <silent> <leader><Esc> <C-l><CR>

nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>m :nohlsearch<CR>
nnoremap <silent> <leader>wq :wq<CR>
" end of line
nnoremap 0 $
vnoremap 0 $
" start of line
nnoremap 9 0
vnoremap 9 0
" comment a line
nmap <F19> <Plug>NERDCommenterToggle
vmap <F19> <Plug>NERDCommenterToggle
