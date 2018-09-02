set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set nu

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

" Manage tabs responsibly
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" Add a sane width
set textwidth=80
set colorcolumn=-1

" Use the mouse in terminal mode
set mouse=a

" Backspace of auto-indents, eols, start of lines
set backspace=indent,eol,start

" Highlight the search
set hlsearch

" Highlight /pattern while typing
set incsearch

" Remap leader to semi-colon
:let mapleader = ";"

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Vim-javascript"
Plugin 'pangloss/vim-javascript'

"Vim-JSX"
Plugin 'neoclide/vim-jsx-improve'

" Powerline
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}

" NERDTree
Plugin 'scrooloose/nerdtree'

" Tmux Navigator
Plugin 'christoomey/vim-tmux-navigator'

" Git Gutter
Plugin 'airblade/vim-gitgutter'

" Color Schemes
Bundle "daylerees/colour-schemes", { "rtp": "vim/" }

" FZF
Plugin 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plugin 'junegunn/fzf.vim'

" Prettier
Plugin 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

" Vim-surround
Plugin 'tpope/vim-surround'

" Ale
Plugin 'w0rp/ale'

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

" Point to fzf
set rtp+=/usr/local/opt/fzf

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Make NERDTree prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Show hidden files in NERDTree by default
let NERDTreeShowHidden = 1

" When we enter {} (and friends), then hit enter, it expands them like I want
" it to
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Escape Insert mode with 'jk'
:inoremap jk <Esc>

" Copy to clipboard
vnoremap <Leader>y "+y

" Search for file name
nnoremap <silent> <leader>t :Files<cr>

" Find in files
map <Leader>f :Find

" Open an interactive buffer list
nnoremap <silent> <leader>b :Buffers<cr>
