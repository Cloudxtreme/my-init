set expandtab
set smarttab
set shiftwidth=4
set tabstop=4


set history=5000

set viminfo='500,<50000,s50000,h


set ignorecase
set smartcase


set hlsearch
set incsearch

set magic

set lazyredraw

set showmatch

set mat=2

set noerrorbells
set novisualbell
set t_vb=
set tm=500


set foldcolumn=1

syntax enable

try
    colorscheme desert
catch
endtry

set background=dark

if has("gui_running")
    set guioptions-=T
    set guioptions-=e
    set t_Co=256
    set guitablabel=%M\ %t
endif


set encoding=utf8

set ffs=unix,dos,mac


set lbr
set tw=500

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines




