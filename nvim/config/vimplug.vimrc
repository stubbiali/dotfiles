" ------------------------------
" vim-plug plugin manager
" ------------------------------
call plug#begin("~/.config/nvim/config/plugged")
  Plug 'Shougo/vimproc.vim', {
    \ 'build': {
    \     'windows': 'tools\\update-dll-mingw',
    \     'cygwin': 'make -f make_cygwin.mak',
    \     'mac': 'make -f make_mac.mak',
    \     'linux': 'make',
    \     'unix': 'gmake',
    \    },
    \ }

  " Unite all interfaces.
  Plug 'Shougo/denite.nvim'
  if !has('nvim')
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'
  endif

  " Semantic autocompletion.
  Plug 'Shougo/deoplete.nvim'

  " deoplete for Python.
  Plug 'deoplete-plugins/deoplete-jedi'

  " Python goto functionalities.
  Plug 'davidhalter/jedi-vim'

  " deoplete for C/C++/Objective-C/Objective-C++.
  Plug 'zchee/deoplete-clang'

  " Lightweight status line.
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " The ultimate solution for snippets in Vim.
  " Plug 'SirVer/ultisnips'
  " Plug 'honza/vim-snippets'

  " Easy code formatting by integrating external tools.
  Plug 'Chiel92/vim-autoformat'

  " NERDTree is a file system explorer.
  Plug 'scrooloose/nerdtree'

  " Sublime Text style multiple selections.
  Plug 'terryma/vim-multiple-cursors'

  " Insert mode completions with Tabs.
  Plug 'ervandew/supertab'

  " Reproduction of the official JetBrains IDE Darcula theme.
  Plug 'doums/darcula'
call plug#end()
