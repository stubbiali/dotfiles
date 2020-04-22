" ------------------------------
" dein plugin manager
" ------------------------------
" dein scripts.
if &compatible
  set nocompatible
endif

" Path to dein.vim.
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.vim/bundles')
  " Plugins' root path.
  call dein#begin('~/.vim/bundles')

  " Let dein manage dein.
  call dein#add('~/.vim/bundles/repos/github.com/Shougo/dein.vim')

  " Interactive command execution.
  call dein#add('Shougo/vimproc.vim', {
    \ 'build': {
    \     'windows': 'tools\\update-dll-mingw',
    \     'cygwin': 'make -f make_cygwin.mak',
    \     'mac': 'make -f make_mac.mak',
    \     'linux': 'make',
    \     'unix': 'gmake',
    \    },
    \ })

  " Unite all interfaces.
  call dein#add('Shougo/denite.nvim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  " Semantic autocompletion.
  call dein#add('Shougo/deoplete.nvim')

  " deoplete for Python.
  call dein#add('deoplete-plugins/deoplete-jedi')

  " deoplete for C/C++/Objective-C/Objective-C++.
  call dein#add('zchee/deoplete-clang')

  " Lightweight status line.
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " The ultimate solution for snippets in Vim.
  call dein#add('SirVer/ultisnips')
  call dein#add('honza/vim-snippets')

  " Easy code formatting by integrating external tools.
  call dein#add('Chiel92/vim-autoformat')

  " NERDTree is a file system explorer.
  call dein#add('scrooloose/nerdtree')

  " Sublime Text style multiple selections.
  call dein#add('terryma/vim-multiple-cursors')

  " Install not installed plugins on startup.
  " if dein#check_install()
  "  call dein#install()
  " endif

  " Stop dein.
  call dein#end()
  call dein#save_state()
endif

" Required by dein.
filetype plugin indent on
syntax enable


