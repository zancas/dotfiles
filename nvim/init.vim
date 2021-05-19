set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

syntax enable
filetype plugin indent on
call plug#begin(stdpath('data') . '/plugged')
    Plug 'https://github.com/sheerun/vim-polyglot.git'
    Plug 'https://github.com/rust-lang/rust.vim'
    Plug 'https://github.com/rhysd/vim-clang-format.git'
    Plug 'Shougo/unite.vim'
    Plug 'devjoe/vim-codequery'
    "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()
autocmd BufWritePre *.rs :RustFmt
autocmd BufWritePre *.c :ClangFormat
autocmd BufWritePre *.h :ClangFormat
autocmd BufWritePre *.cpp :ClangFormat

"let g:deoplete#enable_at_startup = 1

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

"set colorcolumn=80
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set number
"set relativenumber
set wildmode=longest,list,full
set wildmenu
highlight ModStatus ctermbg=White ctermfg=Red
set statusline=%F:%#ModStatus#%m%#StatusLine#:{%p%%,%l,%c}
set noswapfile
set autochdir

syntax on
