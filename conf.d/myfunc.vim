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
  elseif &filetype == 'markdown'
    exec 'MarkdownPreview'
  elseif &filetype == 'html'
    exec 'AsyncRun chromium %'
  elseif &filetype == 'plantuml'
    exec '!time plantuml %'
  endif
endfunc


" ======== auto change input method ========
let g:input_toggle = 1
function! Fcitx2en()
  let s:input_status = system("fcitx-remote")
  if s:input_status == 2
    let g:input_toggle = 1
    let l:a = system("fcitx-remote -c")
  endif
endfunction

function! Fcitx2zh()
  let s:input_status = system("fcitx-remote")
  if s:input_status != 2 && g:input_toggle == 1
    let l:a = system("fcitx-remote -o")
    let g:input_toggle = 0
  endif
endfunction

set timeoutlen=150
autocmd InsertLeave * call Fcitx2en()
"autocmd InsertEnter * call Fcitx2zh()


