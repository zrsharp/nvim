set nocompatible
let mapleader=' '
set mouse=a
set encoding=utf-8
set autochdir
let &t_ut=''

" ======== indent settings ========
set expandtab
set smarttab
set smartindent
"set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

autocmd Filetype c,cpp,java,python,go,javascript,css,json
      \ setlocal tabstop=4 softtabstop=4 shiftwidth=4 cindent
autocmd Filetype vim,sh,html,xml,yaml,markdown
      \ setlocal tabstop=2 softtabstop=2 shiftwidth=2

set shiftround

"set foldmethod=indent
set laststatus=2
set foldlevel=99
set scrolloff=4
"set clipboard=unnamedplus

set number
"set list
set relativenumber
set cursorline
"set cursorcolumn
set ruler
set wrap
set showcmd
set wildmenu

set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set smartcase

" ========== key board map =========
map sr :set splitright<CR>:vsplit<CR>
map sl :set nosplitright<CR>:vsplit<CR>
map su :set nosplitbelow<CR>:split<CR>
map sd :set splitbelow<CR>:split<CR>

map <LEADER>h <C-w>h
map <LEADER>l <C-w>l
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k

map <Up> :resize -5<CR>
map <Down> :resize +5<CR>
map <Left> :vertical resize -5<CR>
map <Right> :vertical resize +5<CR>

map te :tabe<CR>
map = :tabnext<CR>
map - :-tabnext<CR>

map <LEADER>rc :e ~/.config/nvim/init.vim<CR>

noremap <LEADER><CR> :nohlsearch<CR>

noremap <LEADER><LEADER> <ESC>/<++><CR>:nohlsearch<CR>c4l

noremap <LEADER>b i****<ESC>hi

