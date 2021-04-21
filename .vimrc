call plug#begin(stdpath('data') . '/plugged')
    Plug 'rust-lang/rust.vim'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()
autocmd BufWritePre *.rs :RustFmt

"let g:deoplete#enable_at_startup = 1

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
