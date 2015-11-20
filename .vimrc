""""""""""""""""""""""""""""""""
"
"" PACKAGE MANAGEMENT
"
"""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" core plugins
Plug 'morhetz/gruvbox'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'easymotion/vim-easymotion'
Plug 'Valloric/YouCompleteMe'

" misc
Plug 'bling/vim-bufferline'

call plug#end()

" enable all the plugins
filetype plugin indent on

""""""""""""""""""""""""""""""""
"
"" SETTINGS & KEYBINDINGS
"
"""""""""""""""""""""""""""""""""
set encoding=utf-8
set hidden
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab
set showcmd
set showmatch
set ls=2
set incsearch
set hlsearch
set ignorecase
set smartcase
set ttyfast
set noshowmode
set cmdheight=1
set backspace=indent,eol,start
set completeopt -=preview
set autoindent
set textwidth=79
set formatoptions=c,q,r,t
set cursorline
set colorcolumn=79
hi colorcolumn cterm=NONE ctermbg=23
set list lcs=trail:¬,tab:».

" set <leader>
let mapleader=","

" gui gvim
set guifont=Fantasque\ Sans\ Mono\ 14
hi NonText guifg=bg
set guioptions=c

" backup/persistance settings
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup

" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

" Colorscheme syntax highlighting
syntax on
colorscheme gruvbox
set background=dark

" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" togglables without FN keys
nnoremap <leader>1 :NERDTreeToggle<CR>

"make enter break and do newlines
nnoremap <CR> O<Esc>j

" visual reselect of just pasted
nnoremap gp `[v`]

"make space in normal mode add space
nnoremap <Space> i<Space><Esc>l

" better scrolling
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

" consistent menu navigation
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" ctrlP config
let g:ctrlp_map = "<c-p>"
nnoremap <leader>t :CtrlPMRU<CR>
nnoremap <leader>bp :CtrlPBuffer<CR>

" easy motion rebinded
nmap <leader>f <Plug>(easymotion-f2)
nmap <leader>F <Plug>(easymotion-F2)

" Smart paste
nnoremap <C-v> "+P=']
inoremap <C-v> <C-o>"+P<C-o>=']

" Keep search matches in the middle of the window.
nnoremap n nzz
nnoremap N Nzz

" gruvbox colorsheme
let g:gruvbox_italic=1

" NerdTree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-plug
"augroup myvimrchooks
"    au!
"    autocmd bufwritepost .vimrc source ~/.vimrc
"augroup END

" airline
let g:airline_theme="bubblegum"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

