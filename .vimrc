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
set termguicolors
set noshowmode

" pluggins
call plug#begin()
    " lsp plugins
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'

    " theme pluggins
    Plug 'catppuccin/vim', { 'as': 'catppuccin' }
    Plug 'itchyny/lightline.vim'
call plug#end()

" visual
" catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
colorscheme catppuccin_mocha 
let g:lightline = {'colorscheme': 'catppuccin_mocha'}

" interface
set wildmode=longest:full,full
set showtabline=2
set laststatus=2

" performance
set lazyredraw
set updatetime=300
set timeoutlen=500


function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
