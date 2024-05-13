" ------------------------------
" Plugin-specific settings
" ------------------------------
" UltiSnips config
" inoremap <silent><expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" airline settings
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_powerline_fonts=1
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = '|'
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = '|'
let g:airline_powerline_fonts=1
let g:airline_theme='molokai'

" Multicursor
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-e>'
let g:multi_cursor_quit_key='<Esc>'
let g:multi_cursor_quit_key='<Esc>'

" autoformat
let g:formattterpath = ['~/.config/nvim/venv/bin/black']
let g:formatdef_black = '"~/.config/nvim/venv/bin/black -"'
let g:formatters_python = ['black']
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0

" deoplete
let g:deoplete#enable_at_startup = 1
if has("gui_running")
   inoremap <silent><expr><C-Space> deoplete#mappings#manual_complete()
else
   inoremap <silent><expr><C-@> deoplete#mappings#manual_complete()
endif

" jedi-vim
let g:jedi#auto_initialization = 1
let g:jedi#auto_vim_configuration = 1
let g:jedi#completions_enabled = 0
let g:jedi#completions_command = "<C-Space>"
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#goto_command = "<Leader>d"
let g:jedi#goto_assignments_command = "<Leader>g"
let g:jedi#goto_stubs_command = "<Leader>st"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<Leader>n"
let g:jedi#rename_command = "<Leader>r"
let g:jedi#show_call_signatures = "1"

" SuperTab
let g:SuperTabDefaultCompletionType = "<tab>"
let g:SuperTabContextDefaultCompletionType = "<tab>"
