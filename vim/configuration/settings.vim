filetype plugin indent on
let mapleader = ','
let localleader= '\\'
" Papercolor themes
" set background=light
" colorscheme PaperColor
colorscheme nord

" Buftabline
let g:buftabline_numbers = 2
let g:buftabline_indicators = 1
let g:python_highlight_all = 1

"vim rainbow
let g:rainbow_active = 1

"ale
let g:ale_linters = {'c': ['clang'], 'cpp':['clang'], 'objcpp':['clang'], 'vim':['vint']}
let g:ale_linters_explicit = 1

"Lightline
let g:lightline = {}

let g:lightline.colorscheme = 'ayu_dark'
let g:lightline.component = {'charvaluehex': '0x%B'}
let g:lightline.component_function = {}
let g:lightline.component_function.gitbranch = 'FugitiveHead'

let g:lightline.active = {}
let g:lightline.active.left = [ [ 'mode', 'paste' ], [ 'gitbranch', 'readonly', 'filename', 'modified' ], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]]
let g:lightline.active.right = [['lineinfo'], ['percent'], ['charvaluehex', 'fileformat',  'filetype']]

"Ale Lightline
let g:lightline.component_expand = {
            \  'linter_checking': 'lightline#ale#checking',
            \  'linter_infos': 'lightline#ale#infos',
            \  'linter_warnings': 'lightline#ale#warnings',
            \  'linter_errors': 'lightline#ale#errors',
            \  'linter_ok': 'lightline#ale#ok',
            \ }

let g:lightline.component_type = {
            \     'linter_checking': 'right',
            \     'linter_infos': 'right',
            \     'linter_warnings': 'warning',
            \     'linter_errors': 'error',
            \     'linter_ok': 'right',
            \ }

let g:lightline#ale#indicator_checking = '...'
let g:lightline#ale#indicator_infos = "i"
let g:lightline#ale#indicator_warnings = "\u2326 "
let g:lightline#ale#indicator_errors = "\u2327 "
let g:lightline#ale#indicator_ok = "\u2713 "

" Netrw
set nohidden

augroup netrw_buf_hidden_fix
    autocmd!

    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter *
                \  if &ft != 'netrw'
                \|     set bufhidden=hide
                \| endif
augroup end

let g:netrw_fastbrowse=0
