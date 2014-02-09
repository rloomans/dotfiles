" pathogen must come before filetype on
execute pathogen#infect()
execute pathogen#helptags()

syntax on
colorscheme jellybeans
filetype plugin indent on

set number

" /searching defaults
set incsearch
set hlsearch
set smartcase

" just for mousewheel scrolling, I promise 0_o
set mouse=a

" highlight the line where the cursor is at for my poor eyes
set cursorline
hi CursorLine term=NONE cterm=NONE guibg=Grey40

" trim trailing whitespace for python files (pep8)
autocmd BufWritePre *.py normal m`:%s/\s\+$//e``

" moar pythons
au BufNewFile,BufRead *.tac set filetype=python

" key mapping
map <leader>t :NERDTreeToggle<CR>
map <leader>o :TagBar<CR>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>

" Emacs-like beginning and end of line in insert mode
imap <c-e> <c-o>$
imap <c-a> <c-o>^

imap <c-space> <c-x><c-o>

" move screenlines not wrapped lines (duh)
nmap k gk
nmap j gj

" Easymode next/prev buffer. Old habit.
map <M-pagedown> :bn <CR>
map <M-pageup> :bp <CR>

" faster tab nav
nnoremap th  :tabprev<CR>
nnoremap tl  :tabnext<CR>
nnoremap tt  :tabclose<CR>

" plugin customisation
" --------------------

" jedi, only complete on c-space
let g:jedi#popup_on_dot = 0

" turn on git branch for airline
let g:airline#extensions#branch#enabled = 1

" filter things out of ctrlp
set wildignore+=*.pyc

" filter things out of nerdtree
let NERDTreeIgnore=['\.pyc$', '\~$']

let g:syntastic_python_checkers=['flake8']

" close quickfix when exiting insert mode (mostly for pydoc window popups)
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:ctrlp_cmd = 'CtrlPCurWD'

" backspace like a boss
set backspace=indent,eol,start

" sane default whitespace/indent. Tabs, whoneedsem.
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab

" always show statusline (even when only one buffer open)
set laststatus=2

" allow dirty buffer switching (insert double entendre here)
set hidden
