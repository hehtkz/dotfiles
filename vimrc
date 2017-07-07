"
"        Vundle
"
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" personal wiki - 13/12/16 
Plugin 'vimwiki/vimwiki'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"
"       User config
"

" syntax highlighting
syntax on
filetype indent plugin on

colorscheme moody

" next tab
nnoremap H gT
" previous tab 
nnoremap L gt
" salvar arquivo
noremap <Leader>s :update<CR>
" indent file
map <F7> mzgg=G`z

" show whitespaces
set list
" convert TAB to spaces
set expandtab
set tabstop=4
" convert tabs to spaces
retab
" show line number
set number
" enable mouse use
set mouse=a
" Automatically wrap left and right
set whichwrap=b,s,<,>,[,]

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

" line width
"set textwidth=80
