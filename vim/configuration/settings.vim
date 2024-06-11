" Enable filetype detection, plugin, and indent settings
filetype plugin indent on

" Set leader keys
let mapleader = ','
let localleader= '\\'

" Color scheme settings
" Uncomment the following lines if you prefer the PaperColor theme
" set background=light
" colorscheme PaperColor
colorscheme nord  " Set colorscheme to Nord

" Buftabline settings
let g:buftabline_numbers = 2     " Show buffer numbers
let g:buftabline_indicators = 1  " Show buffer indicators

" Enable highlighting for all Python syntax
let g:python_highlight_all = 1

" vim-rainbow settings
let g:rainbow_active = 1         " Enable rainbow parentheses

" ALE (Asynchronous Lint Engine) settings
let g:ale_linters = {
      \ 'c': ['clang'],
      \ 'cpp': ['clang'],
      \ 'objcpp': ['clang'],
      \ 'vim': ['vint']
      \ }
let g:ale_linters_explicit = 1   " Use only specified linters

" Lightline settings
let g:lightline = {}
let g:lightline.colorscheme = 'ayu_dark'   " Set Lightline color scheme
let g:lightline.component = {'charvaluehex': '0x%B'}   " Display character value in hex
let g:lightline.component_function = {}
let g:lightline.component_function.gitbranch = 'FugitiveHead'  " Show Git branch in Lightline

" Configure active Lightline components
let g:lightline.active = {}
let g:lightline.active.left = [
      \ [ 'mode', 'paste' ],
      \ [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_ok' ]
      \ ]
let g:lightline.active.right = [
      \ ['lineinfo'],
      \ ['percent'],
      \ ['charvaluehex', 'fileformat',  'filetype']
      \ ]

" ALE integration with Lightline
let g:lightline.component_expand = {
      \ 'linter_checking': 'lightline#ale#checking',
      \ 'linter_infos': 'lightline#ale#infos',
      \ 'linter_warnings': 'lightline#ale#warnings',
      \ 'linter_errors': 'lightline#ale#errors',
      \ 'linter_ok': 'lightline#ale#ok'
      \ }

let g:lightline.component_type = {
      \ 'linter_checking': 'right',
      \ 'linter_infos': 'right',
      \ 'linter_warnings': 'warning',
      \ 'linter_errors': 'error',
      \ 'linter_ok': 'right'
      \ }

" ALE indicators in Lightline
let g:lightline#ale#indicator_checking = '...'  " Indicator for checking
let g:lightline#ale#indicator_infos = "i"       " Indicator for infos
let g:lightline#ale#indicator_warnings = "\u2326 "  " Indicator for warnings
let g:lightline#ale#indicator_errors = "\u2327 "    " Indicator for errors
let g:lightline#ale#indicator_ok = "\u2713 "    " Indicator for OK

" Netrw settings
set nohidden    " Do not hide buffers

" Fix for Netrw buffer hidden issue
augroup netrw_buf_hidden_fix
    autocmd!
    " Set all non-netrw buffers to bufhidden=hide
    autocmd BufWinEnter * if &ft != 'netrw' | set bufhidden=hide | endif
augroup end

let g:netrw_fastbrowse = 0  " Disable fast browsing in Netrw

