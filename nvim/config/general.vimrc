" ------------------------------
" General settings
" ------------------------------
" Theme
highlight SignColumn guibg=#272822
let g:rehash256 = 1
let g:molokai_original=1
let NERDTreeIgnore = ['_site']

" Show the line and column numbers of the cursor.
set ruler

" Show line number.
set number

" Continue comment marker in new lines.
" set formatoptions+=o

" Hard-wrap long lines as you type them.
set textwidth=80

" Enable modeline.
set modeline

" Set line-spacing to minimum.
set linespace=0

" Prevents inserting two spaces after punctuation on a join (J).
set nojoinspaces

" Horizontal split below current.
set splitbelow

" Vertical split to right of current.
set splitright

" Show next 3 lines while scrolling.
if !&scrolloff
  set scrolloff=3
endif

" Show next 5 columns while side-scrolling.
if !&sidescrolloff
  set sidescrolloff=5
endif

" Show as much as possible of the last line.
set display+=lastline

" Do not jump to first character with page commands.
set nostartofline

" No beeps.
set noerrorbells

" Makes backspace key more powerful.
set backspace=indent,eol,start

" Show me what I'm typing.
set showcmd

" Show current mode.
set showmode

" Don't use swapfile.
set noswapfile

" Don't create annoying backup files
set nobackup

" Set default encoding to UTF-8.
set encoding=utf-8

" Automatically save before :next, :make etc.
set autowrite

" Automatically reread changed files without asking me anything.
set autoread

" Always show the status of a window on the last line.
set laststatus=2

" Prefer Unix over Windows over OS 9 formats
set fileformats=unix,dos,mac

" Do not show matching brackets by flickering
set showmatch

" Show matching angle brackets.
" set matchpairs+=<:>

" Shows the match while typing
set incsearch

" Highlight found searches
set hlsearch

" Search case insensitive...
set ignorecase

" ... but not when search pattern contains upper case characters.
set smartcase

" Enable automatic indentation.
set autoindent

" Tabs' length.
set tabstop=4 shiftwidth=4

" Use 'g' flag by default with :s/foo/bar/.
set gdefault

" Use 'magic' patterns (extended regular expressions).
set magic

" Disable spell checking.
set nospell

" Enable mouse support
set mouse=

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines.
if &listchars ==# 'eol:$'
  " set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
  set listchars=tab:>\ ,extends:>,precedes:<,nbsp:+
endif

