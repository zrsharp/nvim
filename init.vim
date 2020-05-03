"******************************************************
"  _____                ____  _                       *
" |__  /___ _ __ ___   / ___|| |__   __ _ _ __ _ __   *
"   / // _ \ '__/ _ \  \___ \| '_ \ / _` | '__| '_ \  *
"  / /|  __/ | | (_) |  ___) | | | | (_| | |  | |_) | *
" /____\___|_|  \___/  |____/|_| |_|\__,_|_|  | .__/  *
"                                             |_|     *
"                                                     *
"******************************************************

syntax on
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on

if has("autocmd")
  autocmd BufReadPost ~/.config/nvim/init.vim
        \ if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

source ~/.config/nvim/conf.d/base.vim

" ======== load plugin ========
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim
endif

call plug#begin('~/.config/nvim/plugged')
" Appearance
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'connorholyday/vim-snazzy'
Plug 'ryanoasis/vim-devicons'
Plug 'rafalbromirski/vim-airlineish'

" File navigation
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Taglist
Plug 'majutsushi/tagbar', { 'on': 'TagbarOpenAutoClose' }

" Error checking
Plug 'dense-analysis/ale'

" Auto Complete
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Depend on https://github.com/OmniSharp/omnisharp-roslyn
Plug 'OmniSharp/omnisharp-vim'
Plug 'preservim/nerdcommenter'

" Code Format
Plug 'Chiel92/vim-autoformat'

" Undo Tree
Plug 'mbbill/undotree/'

" Search
Plug 'rking/ag.vim'

" Other visual enhancement
Plug 'Yggdroot/indentLine'

" Json
Plug 'leshill/vim-json'

" html css js
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'

" Python
Plug 'vim-scripts/indentpython.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

"UML
Plug 'aklt/plantuml-syntax', { 'for': ['plantuml'] }

" Markdown
Plug 'godlygeek/tabular'
Plug 'iamcco/markdown-preview.nvim'
Plug 'dhruvasagar/vim-table-mode'
Plug 'mzlogin/vim-markdown-toc'

Plug 'skywind3000/asyncrun.vim'
Plug 'lambdalisue/suda.vim'

call plug#end()

source ~/.config/nvim/conf.d/appearance.vim
source ~/.config/nvim/conf.d/coc.vim
source ~/.config/nvim/conf.d/myfunc.vim

set completeopt=menu

let g:ale_linters = {
      \   'asm': [],
      \}

" ======== indentLine ========
let g:indentLine_setConceal = 0

"" NERDTree-git
let g:NERDTreeIndicatorMapCustom = {
      \ "Modified"  : "✹",
      \ "Staged"    : "✚",
      \ "Untracked" : "✭",
      \ "Renamed"   : "➜",
      \ "Unmerged"  : "═",
      \ "Deleted"   : "✖",
      \ "Dirty"     : "✗",
      \ "Clean"     : "✔︎",
      \ 'Ignored'   : '☒',
      \ "Unknown"   : "?"
      \ }

" html css js
"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_ngdoc = 1
"let g:javascript_plugin_flow = 1
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END
set conceallevel=0
set concealcursor="v"
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Taglist
map T :TagbarOpenAutoClose<CR>

" ======== vim-table-mode ========
let g:table_mode_corner='|'
function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
      \ <SID>isAtStartOfLine('\|\|') ?
      \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
      \ <SID>isAtStartOfLine('__') ?
      \ '<c-o>:silent! TableModeDisable<cr>' : '__'

" ======== autoformat ========
noremap <F3> :Autoformat<CR>
autocmd filetype cs noremap <F3> :OmniSharpCodeFormat<CR>

" ======== omnisharp ========
let g:OmniSharp_server_stdio = 1
let g:OmniSharp_server_use_mono = 1

" ======== suda ========
let g:suda#prefix = ['suda://', 'sudo://', '_://']

" ====== nasm ========
let g:asmsyntax = 'nasm'
