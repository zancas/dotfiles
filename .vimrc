call plug#begin(stdpath('data') . '/plugged')
    Plug 'rust-lang/rust.vim'
call plug#end()

nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

set colorcolumn=80
set tabstop=4
set shiftwidth=4
set expandtab
set laststatus=2
set number
set wildmode=longest,list,full
set wildmenu
set statusline+=%F
set noswapfile
set autochdir

syntax on

let g:rustfmt_autosave = 1
