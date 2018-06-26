"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Just Another Vimrc - no plugins (lite)
"
" Inspirations from:
"       * https://github.com/amix/vimrc
"       * https://github.com/bhanderson/dotfiles
"       * http://got-ravings.blogspot.com/search/label/statuslines
"       * http://got-ravings.blogspot.com/2008/08/vim-pr0n-making-statuslines-that-own.html
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sets how many lines of history VIM has to remember
set history=1000

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
map <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command W w !sudo tee % > /dev/null

" Quick Commands
map <leader>kf gg=G``zz
map <leader>kw :%s/\s\+$//<cr>
map <leader>m <c-w><right>
map <leader>n <c-w><left>
map <leader>s :!sort<cr>
map <leader>v <c-w><c-v>
map <leader>b :TagbarToggle<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't add the comment prefix when hitting enter or o/O on a comment line.
autocmd FileType * setlocal formatoptions-=r

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Turn on the WiLd menu
set wildmenu

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
set wildignore+=.git\*,.hg\*,.svn\*
endif

"Always show current position in bottom status bar
set ruler
set laststatus=2
set statusline=%t[%{strlen(&fenc)?&fenc:'none'},%{&ff}]%h%m%r%y%=%l,%c\ \ \ \ %P/%L\ \ 

" Height of the command bar
set cmdheight=1

" A buffer becomes hidden when it is abandoned
set hid

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" In many terminal emulators the mouse works just fine, thus enable it.
" " disabled for use of scroll paste, see below
" " clipboard=autoselect forces vim to take over selection to break the white
" " space padding that happens on paste

" copies to X's primary selection
"if has('unnamedplus')
"	set clipboard=unnamed,unnamedplus
"else
"	set clipboard=unnamed
"endif
"
"if has('mouse')
"	set mouse=a
"else
"	set mouse=c
"endif

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Add a bit extra margin to the left
" disabled because crontab complained
" set foldcolumn=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable syntax highlighting
syntax enable

try
colorscheme desert
catch
endtry

" check here if colors are broken
set background=dark
set t_Co=256

" Set extra options when running in GUI mode
if has("gui_running")
set guioptions-=T
set guioptions-=e
set guitablabel=%M\ %t
endif

"" Vertical markers/highlighting
" NOTE: having CC enabled, pads yanks from vim to vim
"set cc=81
set cursorline
"" if 256 bit
hi ColorColumn ctermbg=235 guibg=#2c2d27
"" otherwise...
"hi ColorColumn ctermbg=0 guibg=#000000
let &colorcolumn=join(range(82,999),",")
let &colorcolumn="81,".join(range(120,999),",")

"hi Normal guibg=#32322f ctermbg=236
"hi NonText guibg=#32322f ctermbg=236
"let &colorcolumn=join(range(1,80),",")


" Set utf8 as standard encoding and en_US as the standard language
"set encoding=utf-8
"set fileencodings=utf-8

" Use Unix as the standard file type
"set ffs=unix,dos,mac


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" The width of a hard tabstop measured in 'spaces'
"" - effectively the (maximum) width of an actual tab character.
set tabstop=2

"" The size of an 'indent'. It's also measured in spaces, so if your code base
"" indents with tab characters then you want shiftwidth to equal the number of
"" tab characters times tabstop. This is also used by things like the =, > and
"" < commands.
set shiftwidth=2

"" Setting this to a non-zero value other than tabstop will make the tab key
"" (in insert mode) insert a combination of spaces (and possibly tabs) to
"" simulate tab stops at this width.
" set  softtabstop=0

"" Enabling this will make the tab key (in insert mode) insert spaces instead of
"" tab characters. This also affects the behavior of the retab command.
set expandtab

"" Enabling this will make the tab key (in insert mode) insert spaces or tabs to
"" go to the next indent of the next tabstop when the cursor is at the beginning
"" of a line (ie: the only preceding characters are whitespace).
set smarttab


"" Linebreak on 500 characters
set lbr
set tw=500

"" This is turned off to alleviate the pains of vi users.  This allows for copy
"" and scroll clicking to paste, while in insert mode.
"set ai "Auto indent
"set si "Smart indent
"set wrap "Wrap lines


""""""""""""""""""""""""""""""
" ==> Visual mode related
""""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

"match Error /\%81v.\+/
"set colorcolumn=81
"set cc=80,81,82,83
"highlight OverLength ctermbg=DarkGray ctermfg=Gray guibg=#592929
"match OverLength /\%81v.\+/
highlight OverLength ctermbg=DarkGray ctermfg=Gray guibg=#592929
match OverLength /\%81v.\+/


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Scroll paste settings
"set nopaste
"if has("gui_running")
" mouse visual block (ala MS Word)
"nmap <A-LeftMouse> ms<LeftMouse><C-v>`so
"imap <A-LeftMouse> <Esc><C-v>`^ms<Esc>gi<LeftMouse><C-o><C-v>`so
"vmap <A-LeftDrag>  <LeftDrag>
"vmap <A-LeftMouse> <C-v><LeftMouse>msgv`s
"vmap <S-LeftMouse> v<LeftMouse>msgv`s
"set mouse=ra clipboard=autoselect

"elseif has('mouse')
"set mouse=ra
"set clipboard=unnamed
"else
""paste toggle
"nmap <F7>      :set paste! paste?<CR>
"imap <F7> <C-o>:set paste!<CR>
"vmap <F7> <Esc>:set paste!<CR>gv
"xterm mouse with middleclick paste
"nnoremap <MiddleMouse> i<MiddleMouse>
"vnoremap <MiddleMouse> s<MiddleMouse>
"set pastetoggle=<F7> mouse=rnv
"endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" ==> Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set wildmode=longest,list,full
" set number
"set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮,trail:·

" Highlight bad whitespace when not in insert as red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" fix markdown
autocmd BufNewFile,BufRead *.md set filetype=markdown
