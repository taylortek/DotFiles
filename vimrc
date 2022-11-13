:set mouse=a
syntax on

if &term =~ '^screen'
    " tmux will send xterm-style keys when its xterm-keys option is on
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

:set smartindent

:filetype indent on
:set tabstop=4
:set shiftwidth=4

set shell=/bin/bash

:set background=dark

:set backspace=indent,eol,start

set encoding=utf-8

noremap x "_x
noremap X "_x
noremap <Del> "_x

" vim-plug

set nocompatible
filetype off

call plug#begin()

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'puremourning/vimspector'

let g:coc_node_path = substitute(system('which node'), '\n', '', '')

let g:airline#extensions#tabline#enabled = 1

source ~/.vim/.cocrc.vim
source ~/.vim/.nerdtree.vim
source ~/.vim/.inspect.vim
source ~/.vim/smartclose.vim

call plug#end()
