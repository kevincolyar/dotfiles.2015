set nocompatible               " Use vim features

filetype off
colorscheme molokai            " Color scheme
syntax on                      " Turn on syntax highlighting

" - Settings ---------------------------------------------------------- "
 
set shell=/bin/sh               " Ensure vim always runs from a shell, rvm needs this.
set lazyredraw                  " Do not redraw while running macros (much faster) (LazyRedraw)
set clipboard=unnamed           " Use the OSX pasteboard
set cursorline                  " Highlight line curor is on
set number                      " Show line numbers
set history=1000                " Lots of history
set laststatus=2                " Always show status bar

set showcmd     		" Show incomplete cmds down the bottom
set showmode    		" Show current mode down the bottom

set incsearch   		" Find the next match as we type the search
set hlsearch    		" Hilight searches by default

set nowrap      		" Dont wrap lines
set linebreak   		" Wrap lines at convenient points

set ignorecase  		" Ignore case in searches
set nohlsearch  	  	" Turn off highlighting when done searching

set tags=./tags 		" Ctags
set complete=.,t,b		" Use ctags and current buffer for completion
set grepprg=ack			" Using ack instead of grep

set vb                          " Use visual bell instead of audible bell
set hidden                      " Hide buffers when not displayed
set t_Co=256                    " Enable 256 color
set noswapfile                  " It's 2012, Vim.

set foldmethod=syntax           "fold based on syntax
set foldnestmax=3               "deepest fold is 3 levels
set nofoldenable                "dont fold by default

set wildmode=list:longest       "make cmdline tab completion similar to bash
set wildmenu                    "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     "stuff to ignore when tab completing
set wildignore+=vendor/rails/**
set wildignore+=*.swp
set wildignore+=*/build/**

set listchars=tab:▸\ ,eol:¬     " Tabs and trailing space characters
set nolist                      " Off by default

set formatoptions-=o            " Dont continue comments when pushing o/O

" Setup back directory, where all .sw* files are kept
set backupdir=/var/tmp/
set directory=/var/tmp/

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" - Vundle ---------------------------------------------------------- "
 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-ragtag'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-repeat'
Bundle 'msanders/cocoa.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/ctrlp.vim'
Bundle 'esukram/taglist.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'pangloss/vim-javascript'
Bundle 'mattn/gist-vim'
Bundle 'xenoterracide/css.vim'
Bundle 'mileszs/ack.vim'
Bundle 'ujihisa/camelcasemotion'
Bundle 'Raimondi/delimitMate'
Bundle 'edsono/vim-matchit'
Bundle 'vim-scripts/AutoTag'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/tComment'
Bundle 'derekwyatt/vim-fswitch'
Bundle 'godlygeek/tabular'
Bundle 'gregsexton/MatchTag'

" Snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "snipmate-snippets"
Bundle "garbas/vim-snipmate"

filetype plugin indent on      " Load ftplugins and indent files

" - Variables ------------------------------------------------------------- "
 
let mapleader = ","

let localvimrc_sandbox=0
let localvimrc_ask=0

let g:Powerline_symbols='fancy'

" Syntastic
" let g:syntastic_enable_signs=1

" CtrlP
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_depth = 20
let g:ctrlp_user_command = "find %s '(' -type f -or -type l ')' -maxdepth " . g:ctrlp_max_depth . " -not -path '*/\.*/*' | egrep -v '\.(swp|swo|log|gitkeep|keepme|so|o)$'"
let g:ctrlp_dont_split = 'NERD_tree_2'  " let ctrlp open up in that initial window, but future ones (which are really thin sidebars) will still jump out.

" NerdTree
let NERDTreeWinSize=50
let NERDTreeDirArrows=1

" Gist
let g:gist_open_browser_after_post = 1

" Ctags
if has("macunix")
  let Tlist_Ctags_Cmd = "/opt/local/bin/ctags"
endif

" - Maps ----------------------------------------------------------------- "

" Fix regexes
nnoremap / /\v
vnoremap / /\v

" Replace all instance of word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/

" Ack with the word under cursor
nnoremap <Leader>a :Ack <C-r><C-w>

" Git maps
map <Leader>gs :Gstatus<CR>
map <Leader>gc :Gcommit<CR>
map <Leader>gd :Gdiff<CR>

" Navigating Splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Show whitespace and newline characters
nmap <leader>l :set list!<CR>

" Toggle NERDTree
nmap <silent> <leader>o :NERDTreeToggle<CR>

" bind control-l to hashrocket
imap <C-l> <Space>=><Space>

" Make Y consistent with C and D
nnoremap Y y$

" Ack
nnoremap <c-a> :Ack 

" Auto-completion for command line mode
cmap <C-n> <Up>
nmap <leader>p iputs "
imap <leader>p puts "
map <leader># i#{
imap <leader># #{

" - Auto Commands ---------------------------------------------------- "

" Spell checking, wrapping, and autocomplete for text files
autocmd BufNewFile,BufRead *.txt set wrap
autocmd BufNewFile,BufRead *.txt set spell
autocmd BufNewFile,BufRead *.txt set dictionary+=/usr/share/dict/words

" Open last position in file
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \ exe "normal g`\"" |
    \ endif

" For all text files set 'textwidth' to 78 characters.
autocmd FileType text setlocal textwidth=78

" Close fugitive buffers when hidden
autocmd BufReadPost fugitive://* set bufhidden=delete

" Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
" This also fixes autocompletion slowness in large projects.
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" Arduino
autocmd BufNewFile,BufRead *.pde set filetype=arduino

" Objective-C
autocmd BufNewFile,BufRead *.m set filetype=objc
