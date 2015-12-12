set nocompatible

set hlsearch
set showmatch
set ignorecase
syntax enable

set smartindent

set noswapfile
set nobackup
set nowritebackup

set background=dark

set number

" Use spaces for indent
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" git commit -- see https://robots.thoughtbot.com/5-useful-tips-for-a-better-commit-message
autocmd Filetype gitcommit setlocal spell textwidth=72

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

