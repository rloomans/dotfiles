execute pathogen#infect()
syntax on
set background=dark
colorscheme solarized

set number

filetype plugin indent on

" search case insensitive unless Caps in search term
set incsearch
set hlsearch
set smartcase
set mouse=a
set noesckeys

" trim trailing whitespace for python files (pep8)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

" moar pythons
au BufNewFile,BufRead *.tac set filetype=python

" key mapping
map <leader>n :NERDTreeToggle<CR>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
imap <c-a> <c-o>^

" move screenlines not wrapped lines
nmap k gk
nmap j gj

" plugin customisation
let g:pymode_folding = 0
let g:pymode_lint = 0


map <M-pagedown> :bn <CR>
map <M-pageup> :bp <CR>

autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
let g:ctrlp_cmd = 'CtrlPCurWD'
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab

" always show statusline
set laststatus=2

" allow dirty buffer switching
set hidden
