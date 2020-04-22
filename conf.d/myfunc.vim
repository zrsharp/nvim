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
    endif
endfunc 
