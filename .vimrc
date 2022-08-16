set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
set nu

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
nmap ; :

" When we enter {} (and friends), then hit enter, it expands them like I want
" it to
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" Escape Insert mode with 'jk'
:inoremap jk <Esc>

" Copy to clipboard
vnoremap <Leader>y "+y

" Open an interactive buffer list
nnoremap <silent> <leader>b :Buffers<cr>

" """""""""""""""""""""""""""""""""""""""""""""""""
" fzf and ripgrep
" Assume both are installed using homebrew
" or you will have issues with this setup
" """""""""""""""""""""""""""""""""""""""""""""""""
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

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --glob "!node_modules/" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Search for file name
nnoremap <silent> <leader>t :Files<cr>

" Find in files
map <Leader>f :Find

" Make NERDTree prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" Show hidden files in NERDTree by default
let NERDTreeShowHidden = 1
