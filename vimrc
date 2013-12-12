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

" move screenlines not wrapped lines (duh)
nmap k gk
nmap j gj

" Easymode next/prev buffer. Old habit.
map <M-pagedown> :bn <CR>
map <M-pageup> :bp <CR>

" plugin customisation
" --------------------

" jedi, only complete on c-space
let g:jedi#popup_on_dot = 0

" turn on git branch for airline
let g:airline#extensions#branch#enabled = 1

" filter things out of ctrlp
set wildignore+=*.pyc

let g:syntastic_python_checkers=['flake8']

" close quickfix when exiting insert mode (mostly for pydoc window popups)
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:ctrlp_cmd = 'CtrlPCurWD'

" sane default whitespace/indent. Tabs, whoneedsem.
"set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=80
set smarttab
set expandtab

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" always show statusline (even when only one buffer open)
set laststatus=2

" allow dirty buffer switching (insert double entendre here)
set hidden

" keep 50 lines of command line history
set history=50

" show the cursor position all the time
set ruler
"
" display incomplete commands
set showcmd

" Show matching brackets.
set showmatch	

" don't use ex mode, use q for formatting
map q gq

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

highlight RedundantSpaces ctermbg=red guibg=red
match RedundantSpaces /\s\+$\| \+\ze\t/

" make tab in v mode work like I think it should (keep highlighting):
vmap <tab> >gv
vmap <s-tab> <gv

