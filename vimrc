"==============================================================================
"        Vundle
"==============================================================================
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" personal wiki - 13/12/16
Plugin 'vimwiki/vimwiki'

Plugin 'w0rp/ale'
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
            \ 'bash': ['shellcheck'],
            \ 'c': ['gcc'],
            \ 'go': ['golint'],
            \ 'javascript': ['jshint'],
            \}
let g:ale_fixers = {
            \ 'javascript': ['prettier'],
            \ 'go': ['gofmt'],
            \}
let g:ale_sign_error = 'EE'
let g:ale_sign_warning = 'WW'
" pep8 indentation
Plugin 'hynek/vim-python-pep8-indent'

" status/tabline
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='bubblegum'

" a Git wrapper
Plugin 'tpope/vim-fugitive'

" colorize all text in the form #rgb, #rgba, #rrggbb, etc.
Plugin 'lilydjwg/colorizer'

Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"==============================================================================
"       User config
"==============================================================================

" syntax highlighting
if !has('g:syntax_on')|syntax enable|endif
colorscheme moody

nnoremap H gT                         " next tab
nnoremap L gt                         " previous tab

nnoremap <Leader>s :update<CR>        " save file with \s
nnoremap <F7> mzgg=G`z                " indent file with F7

set list                              " show tabs, \n and whitespaces
set expandtab                         " convert TAB to spaces
set shiftwidth=4
set softtabstop=4

set number                            " show line number
set mouse=a                           " enable mouse use
set whichwrap=b,s,<,>,[,]             " automatically wrap left and right

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set textwidth=79                      " line width
set colorcolumn=80
set nowrap                            " disable line wrapping

" enables a menu at the bottom of the window for completion in the commandline
" via tab
set wildmenu
set wildmode=list:longest,full
set laststatus=2                      " display the status line always

set scrolloff=10
set smartcase                         " case sensitive searching when not all lowercase
set noshowmode                        " don't show mode
