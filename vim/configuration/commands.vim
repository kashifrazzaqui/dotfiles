set encoding=utf8

" Enable true color support
if has('gui_running')
    if has('mac')
        if has('nvim')
            " Do nothing
        else
            set macligatures
            set guifont=Fira\ Code\ Retina:h22
        endif
    endif

    set linespace=8
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions-=l
    set guioptions-=b
    set guioptions-=m
    set guioptions-=P
    set guioptions-=c
else
    let &t_8f="\e[38;2;%lu;%lu;%lum"
    let &t_8b="\e[48;2;%lu;%lu;%lum"

    if !has('nvim')
        set t_ut=
        set termguicolors
    endif
endif

if !has('nvim')
    set nocompatible
    set backspace=indent,eol,start
    set autoread
    set autoindent smartindent cindent
    set hlsearch
    set incsearch
    set laststatus=2
    set mouse=a
    set smarttab
    set wildmenu
endif

if has('gui_macvim')
    set macmeta
endif

set confirm
set cursorline
set cursorcolumn
set fileformat=unix
set wildmode=longest,full
set history=10000
set undofile
set undodir=~/.vim/undodir
set completeopt=menu
set hidden
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set magic
set nobackup
set noswapfile
set noshowmode " Hides default insert indicator - we have lightline
set ignorecase
set smartcase
set showmode
syntax on
set pastetoggle=<F2>
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set linebreak
set showbreak=\ \ \ \ ↘\ \ \ \
set noerrorbells
set shiftround
set cf
set clipboard+=unnamed
set complete=.,w,b,u,U
set listchars=""
set listchars+=tab:‣‣
set listchars+=trail:∙
set foldlevel=10
set number
set relativenumber
set scrolloff=4
set sidescrolloff=4
set splitright
set updatetime=300 " Reduce time for highlighting other references

set statusline=

" Statusline {{{
hi User0 guifg=#ffffff  guibg=#094afe
hi User1 guifg=#ffffff  guibg=#810085
hi User2 guifg=#051d00  guibg=#7dcc7d
hi User3 guifg=#ffffff  guibg=#5b7fbb

set statusline+=%0*\[Buf\ %n]                  " buffernr
set statusline+=%2*\ %f\                       " File+path
set statusline+=%0*\ %y\                       " FileType
set statusline+=%0*\ %=\ row:%l/%L\ (%03p%%)\  " Rownumber/total (%)
set statusline+=%2*\ col:%03c\                 " Colnr
set statusline+=%2*\ \ %m%r%w\ %P\ \           " Modified? Readonly? Top/bot.
" }}}

" For buftab line
hi BufTabLineCurrent guifg=#ef6f4c guibg=#323438
hi BufTabLineActive guifg=#6195ed guibg=#323438
hi BufTabLineHidden guifg=#c0c0c0 guibg=#323438
hi BufTabLineFill guifg=#ffffff guibg=#323438
