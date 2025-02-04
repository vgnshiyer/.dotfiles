" Plugins 
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

" Basic
set number
set relativenumber
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

" plugins
source $HOME/.vim/init/plugins.vimrc

" lsp settings -- coc
source $HOME/.vim/init/coc.vimrc

" file explorer settings -- nerdtree
source $HOME/.vim/init/nerdtree.vimrc

" key bindings
source $HOME/.vim/init/keybindings.vimrc

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

set backspace=indent,eol,start
