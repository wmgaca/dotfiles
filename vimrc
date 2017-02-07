execute pathogen#infect()

syntax enable
colorscheme desert
set background=dark

filetype on
filetype plugin indent on

set nocompatible
set encoding=utf-8
set ruler
set number
set wrap
set linebreak
set nolist
set wrapmargin=0
set tabstop=4
set softtabstop=4
set sw=4
set report=0
set expandtab
set autoindent
set winfixwidth
set ttyfast
set scrolloff=8
set noerrorbells

set hlsearch
set incsearch
set ignorecase
set smartcase

autocmd BufWritePre * :%s/\s\+$//e

let NERDTreeIgnore = ['\.pyc$']
