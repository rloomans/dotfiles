execute pathogen#infect()
execute pathogen#helptags()
syntax on
colorscheme jellybeans


filetype plugin indent on

set number
" search case insensitive unless Caps in search term
set incsearch
set hlsearch
set smartcase
set mouse=a
"set noesckeys
set cursorline
hi CursorLine term=NONE cterm=NONE guibg=Grey40

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
" --------------------

let g:pymode_folding = 0
let g:pymode_lint = 0

" jedi, only on c-space
let g:jedi#popup_on_dot = 0

" turn on git branch for airline
let g:airline#extensions#branch#enabled = 1

" filter things out of ctrlp
set wildignore+=*.pyc

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
