augroup syntax
    autocmd!
    autocmd BufRead,BufNewFile *.dockerfile setfiletype dockerfile
augroup end

augroup vim
    autocmd!
    autocmd FileType vim set syntax=vim
augroup end

augroup markdown autocmd!
    autocmd FileType markdown setlocal textwidth=100 colorcolumn=101 nowrap
augroup end

augroup python
    autocmd!
    autocmd FileType python set tabstop=4
    autocmd FileType python set softtabstop=4
    autocmd FileType python set shiftwidth=4
    autocmd FileType python set textwidth=120
    autocmd FileType python set foldmethod=indent
    autocmd FileType python nnoremap <buffer> <leader>c I#<esc>
    autocmd BufWritePre *.py :%s/\s\+$//e
augroup end

autocmd BufWritePre * %s/\s\+$//e

augroup objc
    au!
    autocmd BufNewFile,BufRead *.m set syntax=objc
augroup END

" For CursorLine colors
autocmd InsertEnter * highlight CursorLine guibg=#414D62 guifg=fg
autocmd InsertLeave * highlight CursorLine guibg=#1f4788 guifg=#ffffff "Lapis Lazuli

"autocmd InsertLeave * highlight CursorLine guibg=#875f9a guifg=fg "Wisteria Purple
"autocmd InsertLeave * highlight CursorLine guibg=#d4d425 guifg=#000 "Yellow
"autocmd InsertLeave * highlight CursorLine guibg=#AD3D00 guifg=#ffffff "Dark Orange/Rust
"autocmd InsertLeave * highlight CursorLine guibg=#39b78 guifg=#ffffff "green
