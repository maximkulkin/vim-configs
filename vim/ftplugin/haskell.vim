" Enable automatic async source checking
autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" Show compilation status in status line
let &l:statusline = '%{empty(getqflist()) ? "[No Errors]" : "[Errors Found]"}' . (empty(&l:statusline) ? &statusline : &l:statusline)
