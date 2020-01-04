" source plugins {{{
if (isdirectory(expand('~/.config/nvim/repos/github.com/Shougo/dein.vim')) && has('nvim'))
    source ~/.config/nvim/plugins.vim
endif
" }}}
"
" settings {{{
if &compatible
    set nocompatible " disable vi compatible
endif
syntax on
filetype plugin indent on              " filetype setting
set autoindent                         " autoindent
set hidden                             " can show other buffer, if unsaved buffer
set wildmenu                           " command line completion
set showcmd                            " show type cmd
set hlsearch                           " highlighting search
set smartcase                          " not ignore case, if include upper char
set backspace=indent,eol,start         " enable delete character by <BS>
set nostartofline                      " below move the cursor to the current
set ruler                              " show ruler
set laststatus=2                       " always show status line
set visualbell t_vb=                   " disable bell
set number                            " show line number

" encoding utf-8 {{{
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932 " read encoding
" }}}

" file template {{{
augroup Template
    autocmd!
    autocmd BufNewFile *.tex 0r ~/.config/nvim/templates/tex.tex
    autocmd BufNewFile *.sh 0r ~/.config/nvim/templates/sh.sh
    autocmd BufNewFile *.py 0r ~/.config/nvim/templates/python.py
augroup END
" }}}

" persistent undo {{{
if has('persistent_undo')
    let &undodir= has('nvim') ? expand('~/.config/nvim/.vimundo') : expand('~/.vim/.vimundo')
    set undofile
endif
" }}}
 
" fold setting {{{
 :set foldmethod=marker
" }}}

" tab setting {{{
set expandtab " use space
set tabstop=4
set shiftwidth=4
set softtabstop=4
" }}}

" keymap {{{{
map Y y$  " line yank
nnoremap <C-L> :nohl<CR><C-L> " disable highlight search
" }}}
