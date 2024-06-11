" Set encoding to UTF-8
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

    " GUI specific options
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
    " Terminal true color support
    let &t_8f="\e[38;2;%lu;%lu;%lum"
    let &t_8b="\e[48;2;%lu;%lu;%lum"

    if !has('nvim')
        set t_ut=
        set termguicolors
    endif
endif

if !has('nvim')
    " Compatibility and indentation settings
    set nocompatible
    set backspace=indent,eol,start
    set autoread
    set autoindent smartindent cindent

    " Search settings
    set hlsearch
    set incsearch

    " Status line and mouse support
    set laststatus=2
    set mouse=a
    set smarttab
    set wildmenu
endif

" GUI MacVim specific setting
if has('gui_macvim')
    set macmeta
endif

" General settings
set confirm                      " Confirm before exiting unsaved changes
set cursorline                   " Highlight the current line
set cursorcolumn                 " Highlight the current column
set fileformat=unix              " Use Unix line endings
set wildmode=longest,full        " Command-line completion mode
set history=10000                " Increase command history size
set undofile                     " Enable persistent undo
set undodir=~/.vim/undodir       " Set undo directory
set completeopt=menu             " Completion options
set hidden                       " Allow hidden buffers
set wildignore+=*/tmp/*,*.so,*.swp,*.zip  " Ignore certain files in command-line completion
set magic                        " Enable regular expression magic
set nobackup                     " Disable backup files
set noswapfile                   " Disable swap files
set noshowmode                   " Disable showing mode in command line (Lightline handles this)
set ignorecase                   " Ignore case in search patterns
set smartcase                    " Override ignorecase if search pattern contains uppercase letters
set showmode                     " Show the current mode
syntax on                        " Enable syntax highlighting
set pastetoggle=<F2>             " Toggle paste mode with F2
set tabstop=4                    " Set tab width
set shiftwidth=4                 " Set indentation width
set softtabstop=4                " Set soft tab width
set expandtab                    " Use spaces instead of tabs
set wrap                         " Enable line wrapping
set linebreak                    " Break lines at word boundaries
set showbreak=\ \ \ \ ↘\ \ \ \   " Line break indicator
set noerrorbells                 " Disable error bells
set shiftround                   " Round indent to multiple of shiftwidth
set cf                           " Enable error files
set clipboard+=unnamed           " Use the system clipboard
set complete=.,w,b,u,U           " Completion sources
set listchars=""                 " Clear list characters
set listchars+=tab:‣‣            " Show tabs as ‣‣
set listchars+=trail:∙           " Show trailing spaces as ∙
set foldlevel=10                 " Set initial fold level
set number                       " Show line numbers
set relativenumber               " Show relative line numbers
set scrolloff=4                  " Minimum number of screen lines to keep above and below the cursor
set sidescrolloff=4              " Minimum number of screen columns to keep to the left and right of the cursor
set splitright                   " Vertical splits open to the right
set updatetime=300               " Faster updates for better performance

" Statusline configuration
set statusline=

" Statusline appearance {{{
hi User0 guifg=#ffffff  guibg=#094afe
hi User1 guifg=#ffffff  guibg=#810085
hi User2 guifg=#051d00  guibg=#7dcc7d
hi User3 guifg=#ffffff  guibg=#5b7fbb

set statusline+=%0*\[Buf\ %n]                  " Buffer number
set statusline+=%2*\ %f\                       " File path
set statusline+=%0*\ %y\                       " File type
set statusline+=%0*\ %=\ row:%l/%L\ (%03p%%)\  " Row number and percentage
set statusline+=%2*\ col:%03c\                 " Column number
set statusline+=%2*\ \ %m%r%w\ %P\ \           " Modified, readonly, and top/bottom
" }}}

" Buftabline appearance
hi BufTabLineCurrent guifg=#ef6f4c guibg=#323438
hi BufTabLineActive guifg=#6195ed guibg=#323438
hi BufTabLineHidden guifg=#c0c0c0 guibg=#323438
hi BufTabLineFill guifg=#ffffff guibg=#323438

