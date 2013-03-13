set nocompatible               " Use vim features
colorscheme molokai            " Color scheme

" - Vundle ---------------------------------------------------------- "

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
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
Bundle 'nelstrom/vim-markdown-folding'
" Bundle 'Raimondi/delimitMate'
Bundle 'edsono/vim-matchit'
Bundle 'vim-scripts/AutoTag'
Bundle 'vim-scripts/IndexedSearch'
Bundle 'vim-scripts/tComment'
Bundle "vim-scripts/applescript.vim"
Bundle 'derekwyatt/vim-fswitch'
Bundle 'godlygeek/tabular'
Bundle 'gregsexton/MatchTag'
Bundle 'ecomba/vim-ruby-refactoring'
Bundle 'benmills/vimux.git'
Bundle "mattn/zencoding-vim"
Bundle "Shougo/neocomplcache"
Bundle "airblade/vim-gitgutter"

" Snipmate
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "honza/snipmate-snippets"
Bundle "garbas/vim-snipmate"

" Clojure
Bundle "vim-scripts/VimClojure"
Bundle "tpope/vim-foreplay.git"

" R
Bundle "vim-scripts/Vim-R-plugin"

" Hardmode
Bundle "wikitopian/hardmode"

filetype plugin indent on      " Load ftplugins and indent files
syntax on                      " Turn on syntax highlighting

" - Settings ---------------------------------------------------------- "
 
set shell=/bin/sh               " Ensure vim always runs from a shell, rvm needs this.
set lazyredraw                  " Do not redraw while running macros (much faster) (LazyRedraw)
set clipboard=unnamed           " Use the OSX pasteboard
set cursorline                  " Highlight line curor is on
set number                      " Show line numbers
set history=1000                " Lots of history
set laststatus=2                " Always show status bar

set backspace=indent,eol,start  " Always backspace

set showcmd     		" Show incomplete cmds down the bottom
set showmode    		" Show current mode down the bottom

set incsearch   		" Find the next match as we type the search
set hlsearch    		" Hilight searches by default

set nowrap      		" Dont wrap lines
set linebreak   		" Wrap lines at convenient points

set ignorecase  		" Ignore case in searches
" set nohlsearch  	  	" Turn off highlighting when done searching

set complete=.,b,u,t            " Omnicomplete
set completeopt=menu,preview

set tags=./tags		        " Ctags
set grepprg=ack			" Using ack instead of grep

set vb                          " Use visual bell instead of audible bell
set hidden                      " Hide buffers when not displayed
set t_Co=256                    " Enable 256 color
set noswapfile                  " It's 2012, Vim.
set ttimeoutlen=100             " Timeout for key mappings

set foldmethod=syntax           "fold based on syntax
set foldnestmax=3               "deepest fold is 3 levels
set nofoldenable                "dont fold by default

set wildmode=longest,list:longest       "make cmdline tab completion similar to bash
set wildmenu                    "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~     "stuff to ignore when tab completing
set wildignore+=vendor/rails/**
set wildignore+=*.swp
set wildignore+=tags
set wildignore+=build

set listchars=tab:▸\ ,eol:¬     " Tabs and trailing space characters
set nolist                      " Off by default

set formatoptions-=o            " Dont continue comments when pushing o/O

" Setup back directory, where all .sw* files are kept
" set backupdir=/var/tmp/
" set directory=/var/tmp/
set nobackup
set nowb

"indent settings
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

" Use a line-drawing char for pretty vertical splits.
set fillchars+=vert:│

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

" Set the preview window height.  Used by fugitve plugin
set previewheight=25

set winwidth=79

" Persistent undo
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
  set undolevels=1000
  set undolevels=1000
endif

" Trailing whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" GUI Settings
if has('gui_running')
    set guifont=Menlo\ Regular\ for\ Powerline:h14

    " Remove all the UI cruft
    set go-=TlLrR

    highlight SpellBad term=underline gui=undercurl guisp=Orange

    " Different cursors for different modes.
    set guicursor=n-c:block-Cursor-blinkon0
    set guicursor+=v:block-vCursor-blinkon0
    set guicursor+=i-ci:ver20-iCursor

    if has("gui_macvim")
      " Full screen means FULL screen
      set fuoptions=maxvert,maxhorz
    else
      " Non-MacVim GUI, like Gvim
    end
else
    " Console Vim

    "Just use underlines and red foreground to mark misspellings in console
    highlight clear SpellBad
    highlight SpellBad cterm=underline ctermfg=red
endif



" - Variables ------------------------------------------------------------- "

let mapleader = ";"
let maplocalleader = ";"

let localvimrc_sandbox=0
let localvimrc_ask=0

" Syntastic
let g:syntastic_enable_signs=1

" Powerline
let g:Powerline_symbols = 'fancy'

" CtrlP
let g:ctrlp_map = '<leader>t'
let g:ctrlp_max_height = 20
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_depth = 20
let g:ctrlp_user_command = "find %s '(' -type f -or -type l ')' -maxdepth " . g:ctrlp_max_depth . " -not -path '*/\.*/*' | egrep -v '\.(swp|swo|log|gitkeep|keepme|so|o)$' | egrep -v '.*\/(build|log|vendor)\/.*'"
let g:ctrlp_dont_split = 'NERD_tree_2'  " let ctrlp open up in that initial window, but future ones (which are really thin sidebars) will still jump out.

" NerdTree
let g:NERDTreeWinSize=40
let g:NERDTreeDirArrows=1
let g:NERDTreeMinimalUI=1
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeMapHelp=''

" Gist
let g:gist_open_browser_after_post = 1

" Ctags
if has("macunix")
  let Tlist_Ctags_Cmd = "ctags"
endif

" dbext
let g:dbext_default_profile_myconnection='type=ODBC:user=:passwd=:dsnname=:dbname='
let g:dbext_default_profile = 'myconnection'

" VimClojure
let vimclojure#FuzzyIndent=1
let vimclojure#HighlightBuiltins=1
let vimclojure#HighlightContrib=1
let vimclojure#DynamicHighlighting=1
let vimclojure#ParenRainbow=1
" let vimclojure#WantNailgun=1
let tlist_clojure_settings = 'lisp;f:function'

" - Maps ----------------------------------------------------------------- "

" Make Y behave like other capitals
map Y y$

" <leader>/ toggles hlearch
nmap <silent><cr> :se invhlsearch<CR>

map <silent><leader>q :q<CR>
map <silent><leader>s :split<CR>
map <silent><leader>vs :vsplist<CR>
nnoremap <silent> <C-S> :if expand("%") == ""<CR>browse confirm w<CR>else<CR>confirm w<CR>endif<CR>
imap <c-s> <esc><c-s>a

" Fix regexes
nnoremap / /\v
vnoremap / /\v

" Replace all instance of word under cursor
" nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" Ack with the word under cursor
nnoremap <leader>a :Ack <C-r><C-w>

" Git maps
map <leader>gs :Gstatus<CR>
map <leader>gc :Gcommit<CR>
map <leader>gd :Gdiff<CR>

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

" Ack
nnoremap <c-a> :Ack

" Auto-completion for command line mode
cmap <C-n> <Up>

" CtrlP
map <leader>b :CtrlPBuffer<cr>

" Rename current file (see Functions section)
map <leader>n :call RenameFile()<cr>

" Ctags
map <leader>r :silent! ctags -R 2>&1 > /dev/null &<cr>

" Vimux

" Run the current file with rspec
map <leader>rb :call RunVimTmuxCommand("clear; rspec " . bufname("%"))<CR>

" Prompt for a command to run
map <leader>rp :PromptVimTmuxCommand<CR>

" Run last command executed by RunVimTmuxCommand
map <leader>rl :RunLastVimTmuxCommand<CR>

" Inspect runner pane
map <leader>ri :InspectVimTmuxRunner<CR>

" Close all other tmux panes in current window
map <leader>rx :CloseVimTmuxPanes<CR>

" Interrupt any command running in the runner pane
map <leader>rs :InterruptVimTmuxRunner<CR>

" Indent file
map <leader>i gg=G

" Hardmode
nnoremap <leader>h <Esc>:call ToggleHardMode()<CR>

" - Abbreviations ---------------------------------------------------- "
cnoreabbrev ack Ack

" - Auto Commands ---------------------------------------------------- "
autocmd FileType text setlocal textwidth=78

" Ruby
au! FileType ruby nmap <leader>p iputs "
au! FileType ruby imap <leader>p puts "
au! FileType ruby map <leader># i#{
au! FileType ruby imap <leader># #{

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

" XAML
autocmd BufNewFile,BufRead *.xaml set filetype=xml

" Clojure
autocmd BufNewFile,BufRead *.clj,*.cljs set filetype=clojure
autocmd! FileType *clojure let b:loaded_delimitMate=1
autocmd FileType * if &ft == "vimclojure.clojure" | imap <c-k> <Plug>ClojureReplUpHistory.| endif
autocmd FileType * if &ft == "vimclojure.clojure" | imap <c-j> <Plug>ClojureReplDownHistory.| endif

" Rspec/Cucumber
autocmd BufNewFile,BufRead *.feature,*_spec.rb map <leader>e :call RunCurrentLineTestTest()<cr>
autocmd BufNewFile,BufRead *.feature,*_spec.rb map <leader>f :call RunCurrentTest()<cr>

" eRuby Javascript
autocmd BufNewFile,BufRead *.js.erb set filetype=javascript

" Markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Applescript
autocmd BufNewFile,BufRead *.appl set filetype=applescript

" Idea files
autocmd BufNewFile,BufRead *.idea set filetype=markdown
autocmd BufNewFile,BufRead *.idea nmap <leader>done r✓
autocmd BufNewFile,BufRead *.idea nmap <leader>new o☐

" Clojure
autocmd BufNewFile,BufRead *.clj map <leader>f :%Eval<cr>

" Journal
autocmd BufNewFile,BufRead journal.md nmap <leader>c :call CleanJournal()<cr>

" Hardmode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()
autocmd FileType * if match("(gitcommit)|(nerdtree)|(qf)", &ft) | silent! call EasyMode() | endif

" - Functions ------------------------------------------------------- "

function! RunCurrentTest()
  execute CorrectCommandExecutor() . CorrectTestRunner() " --drb" expand('%:p') . "\")"
endfunction

function! RunCurrentLineTestTest()
  execute CorrectCommandExecutor() . CorrectTestRunner() " --drb" expand('%:p') . ":" . line(".") . "\")"
endfunction

function! RunNormalCommand(cmd)
  return "! " . cmd
endfunction

function! CorrectCommandExecutor()
  if &term == "screen-256color"
    return "call RunVimTmuxCommand(\" "
  endif
  return "RunNormalCommand(\" "
endfunction

function! CorrectTestRunner()
  if match(expand("%"), "\.feature$") != -1
    return "cucumber"
  elseif match(expand("%:p"), "dms") != -1
    return "spec -c"
  elseif match(expand("%"), "keymando.*unit.*_spec\.rb$") != -1
    return "keymando/spec/unit/vim_rspec -c"
  elseif match(expand("%"), "keymando.*integration.*_spec\.rb$") != -1
    return "keymando/spec/integration/vim_rspec -c"
  elseif match(expand("%"), "_spec\.rb$") != -1
    return "rspec -c"
  endif
endfunction

function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction

function! CleanJournal()
  exec '%s/###.*\n\n\n//'
endfunction
