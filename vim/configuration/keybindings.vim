noremap  <F1> <NOP>
vnoremap <F1> <NOP>
inoremap <F1> <NOP>

cnoremap w!! w !sudo tee > /dev/null %

" Replace selection when pasting in visual selection mode
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

nnoremap <leader>bn :enew<CR>
nnoremap <leader>br :call RenameFile()<cr>
nnoremap <leader>cc :cd ~/code<CR>
nnoremap <leader>cd :cd %:h<CR>:pwd<CR>
nnoremap <leader>lcd :lcd %:h<CR>:pwd<CR>
nnoremap <leader>j :%!python -m json.tool<CR>
nnoremap <leader>m :SignatureToggle<CR>
nnoremap <leader>n :nohl<CR>
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>v :e $MYVIMRC<CR>
nnoremap <leader>w <C-W><C-W>
nnoremap <leader>z :e ~/.zshrc<CR>
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>
nnoremap <silent> <leader> :WhichKey ','<CR>


" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" UNDERSCORE now moves a line DOWN
nnoremap _ ddp

" HYPHEN moves line UP
nnoremap - ddkP

nnoremap <Tab> :<C-U>call SwitchBufTab(1)<CR>
nnoremap <S-Tab> :<C-U>call SwitchBufTab(0)<CR>
nnoremap <silent> <Left> <C-b>
nnoremap <silent> <Right> <C-f>
nnoremap <silent> <Down> <C-d>
nnoremap <silent> <Up> <C-u>


" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

"Nerdtree
nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
nmap <leader>N :NERDTreeFind<CR>


"Code related bindings
nnoremap <localleader>f :Autoformat<CR>
nmap <silent> <localleader>t :TestFile --verbose<CR>
nnoremap <localleader>sf :!~/homebrew/bin/swift-format -i %<CR>
nnoremap <localleader>sl :!~/homebrew/bin/swift-format lint %<CR>

