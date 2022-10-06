:set mouse=a

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

"Plugin 'scrooloose/nerdtree'
"Plugin 'OmniSharp/omnisharp-vim'

"Plugin 'YouCompleteMe/youcompleteme.vim'
Plugin 'puremourning/vimspector'

call vundle#end()
filetype plugin indent on 

inoremap <expr> <Tab> pumvisible() ? '<C-n>' :                                                                                                                    
\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

:syntax on
"nnoremap <C-o><C-u> :OmniSharpFindUsages<CR>
"nnoremap <C-o><C-d> :OmniSharpGotoDefinition<CR>
"nnoremap <C-o><C-d><C-p> :OmniSharpPreviewDefinition<CR>
"nnoremap <C-o><C-r> :!dotnet run
let g:vimspector_enable_mappings = 'HUMAN'

"let g:OmniSharp_popup_options = {
"\ 'highlight': 'Normal',
"\ 'padding': [1],
"\ 'border': [1]
"\}

map <S-r> :call Run()<CR>

set clipboard=unnamedplus
set background=dark
let g:OmniSharp_start_server = 0 
