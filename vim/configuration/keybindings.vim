" ==============================================================================
" Keybindings Configuration
" ==============================================================================
" This file contains custom key bindings for Vim, designed to improve your
" productivity and streamline common tasks. Each section below is categorized
" by the type of key binding and includes comments explaining their purpose.
"
" The key bindings covered in this file include:
" 1. Disabling default bindings
" 2. Command-line enhancements
" 3. Visual mode improvements
" 4. Leader key shortcuts
" 5. Buffer and window management
" 6. JSON formatting and code navigation
" 7. NERDTree integration
" 8. Code-related shortcuts
" 9. Miscellaneous enhancements
" ==============================================================================

" ==============================================================================
" Disabling default bindings
" ==============================================================================
noremap  <F1> <NOP>
vnoremap <F1> <NOP>
inoremap <F1> <NOP>

" ==============================================================================
" Command-line enhancements
" ==============================================================================
" Allow saving a file with sudo if permissions are denied
cnoremap w!! w !sudo tee > /dev/null %

" ==============================================================================
" Visual mode improvements
" ==============================================================================
" Replace selection when pasting in visual selection mode
vnoremap p <Esc>:let current_reg = @"<CR>gvdi<C-R>=current_reg<CR><Esc>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain cursor position when yanking a visual selection
vnoremap y myy`y
vnoremap Y myY`y

" ==============================================================================
" Leader key shortcuts
" ==============================================================================
nnoremap <leader>bn :enew<CR>                " Open a new empty buffer
nnoremap <leader>br :call RenameFile()<CR>   " Rename current file
nnoremap <leader>cc :cd ~/code<CR>           " Change directory to code folder
nnoremap <leader>cd :cd %:h<CR>:pwd<CR>      " Change directory to current file's folder
nnoremap <leader>lcd :lcd %:h<CR>:pwd<CR>    " Change local directory to current file's folder
nnoremap <leader>j :%!python -m json.tool<CR> " Format JSON
nnoremap <leader>m :SignatureToggle<CR>      " Toggle mark signatures
nnoremap <leader>n :nohl<CR>                 " Clear search highlighting
nnoremap <leader>sv :source $MYVIMRC<CR>     " Source vimrc file
nnoremap <leader>v :e $MYVIMRC<CR>           " Edit vimrc file
nnoremap <leader>w <C-W><C-W>                " Switch between windows
nnoremap <leader>z :e ~/.zshrc<CR>           " Edit zshrc file
nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel " Surround word with double quotes
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel " Surround word with single quotes
vnoremap <leader>" <esc>`>a"<esc>`<i"<esc>   " Surround selection with double quotes
vnoremap <leader>' <esc>`>a'<esc>`<i'<esc>   " Surround selection with single quotes
nnoremap <silent> <leader> :WhichKey ','<CR> " Display available leader key bindings
nnoremap <leader>f :Autoformat<CR>           " Auto format code

" ==============================================================================
" Buffer and window management
" ==============================================================================
" Move line down
nnoremap _ ddp

" Move line up
nnoremap - ddkP

" Switch buffer tabs
nnoremap <Tab> :<C-U>call SwitchBufTab(1)<CR>
nnoremap <S-Tab> :<C-U>call SwitchBufTab(0)<CR>

" Navigate in command line
nnoremap <silent> <Left> <C-b>
nnoremap <silent> <Right> <C-f>
nnoremap <silent> <Down> <C-d>
nnoremap <silent> <Up> <C-u>

" ==============================================================================
" NERDTree integration
" ==============================================================================
" Toggle NERDTree visibility
nnoremap <expr> <leader>n g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':NERDTreeFind<CR>'
" Find current file in NERDTree
nmap <leader>N :NERDTreeFind<CR>

" ==============================================================================
" Code-related shortcuts
" ==============================================================================
" Run tests for the current file
nmap <silent> <localleader>t :TestFile --verbose<CR>
" Format Swift code
nnoremap <localleader>sf :!~/homebrew/bin/swift-format -i %<CR>
" Lint Swift code
nnoremap <localleader>sl :!~/homebrew/bin/swift-format lint %<CR>

