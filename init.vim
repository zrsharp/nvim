set nocompatible
let mapleader=','
syntax on
filetype on
filetype indent on
filetype plugin on

" ======== load plugin ========
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
          \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	  autocmd VimEnter * PlugInstall --sync | source ~/.config/nvim/init.vim 
endif

if has("autocmd")
    filetype plugin indent on
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set mouse=a
set encoding=utf-8
let &t_ut=''

" ======== indent settings ========
set expandtab
set smarttab
set smartindent
"set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4

autocmd Filetype c,cpp,java,python,javascript,css,json
      \ setlocal tabstop=4 softtabstop=4 shiftwidth=4 cindent
autocmd Filetype vim,sh,md,html,xml,yaml
      \ setlocal tabstop=2 softtabstop=2 shiftwidth=2

set shiftround

" set foldmethod=indent
set laststatus=2
set foldlevel=99
set scrolloff=4
" set clipboard=unnamedplus

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

map <LEADER>rc :e ~/.vim/vimrc<CR>

noremap <LEADER><CR> :nohlsearch<CR>

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

call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'

" Theme
Plug 'connorholyday/vim-snazzy'
Plug 'dracula/vim'
Plug 'sickill/vim-monokai'

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

" Undo Tree
Plug 'mbbill/undotree/'

" Search
Plug 'rking/ag.vim'

" Other visual enhancement
Plug 'Yggdroot/indentLine'

" Json
Plug 'leshill/vim-json'

" html css js
"Plug 'hail2u/vim-css3-syntax'
"Plug 'ap/vim-css-color'
Plug 'mattn/emmet-vim'
"Plug 'pangloss/vim-javascript'

" Python
Plug 'vim-scripts/indentpython.vim'

" git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter' 
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

"UML
Plug 'scrooloose/vim-slumlord'
Plug 'aklt/plantuml-syntax'

" Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim'
Plug 'dhruvasagar/vim-table-mode'
"Plug 'SirVer/ultisnips'

call plug#end()

let g:SnazzyTransparent = 1
colorscheme snazzy 

set completeopt=menu,menuone

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


"" html css js
"let g:javascript_plugin_jsdoc = 1
"let g:javascript_plugin_ngdoc = 1
"let g:javascript_plugin_flow = 1
augroup javascript_folding
  au!
  au FileType javascript setlocal foldmethod=syntax
augroup END
"let g:javascript_conceal_function             = "ƒ"
"let g:javascript_conceal_null                 = "ø"
"let g:javascript_conceal_this                 = "@"
"let g:javascript_conceal_return               = "⇚"
"let g:javascript_conceal_undefined            = "¿"
"let g:javascript_conceal_NaN                  = "ℕ"
"let g:javascript_conceal_prototype            = "¶"
"let g:javascript_conceal_static               = "•"
"let g:javascript_conceal_super                = "Ω"
"let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_noarg_arrow_function = "🞅"
"let g:javascript_conceal_underscore_arrow_function = "🞅"
set conceallevel=1
augroup VimCSS3Syntax
  autocmd!
  autocmd FileType css setlocal iskeyword+=-
augroup END

let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Indent line
let g:indentLine_color_term = 239
" none X terminal
let g:indentLine_color_tty_light = 4 " (default: 4)
let g:indentLine_color_dark = 2 " (default: 2)
" Background (Vim, GVim)
let g:indentLine_bgcolor_term = 202
" let g:indentLine_bgcolor_gui = '#FFFFFF'
"

" git
let g:gitgutter_max_signs = 500  " default value


" Taglist
map T :TagbarOpenAutoClose<CR>

" ====== coc ======
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

let g:coc_global_extensions = ['coc-tsserver', 'coc-html', 'coc-css', 'coc-json',
      \ 'coc-java', 'coc-flutter', 'coc-go', 'coc-phpls', 'coc-python',
      \ 'coc-emmet', 'coc-snippets', 'coc-xml', 'coc-yaml',
      \ 'coc-markdownlint', 'coc-highlight']

let g:tex_flavor = "latex"


" ======== vim-markdown ========
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0
let g:tex_conceal = ""
let g:vim_markdown_math = 1
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_autowrite = 1


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

" ======== compile and run ========
map <F5> :call CompileAndRun()<CR>
func! CompileAndRun()
    exec "w" 
    if &filetype == 'c' 
        exec '!gcc -g -Wall % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'cpp'
        exec '!g++ -g -Wall % -o %<'
        exec '!time ./%<'
    elseif &filetype == 'java'
        exec '!javac -g %'
        exec '!time java %<'
    elseif &filetype == 'python'
        exec '!time python %'
    elseif &filetype == 'go'
        exec '!time go run %'
    elseif &filetype == 'sh'
        exec '!time bash %'
    endif                                                                              
endfunc 
