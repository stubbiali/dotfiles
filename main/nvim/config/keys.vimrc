" ------------------------------
" Custom key bindings
" ------------------------------
" Unmap space...
nnoremap <Space> <Nop>

" Before promoting it to leader.
let mapleader="\<Space>"

" Clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <C-L> :nohlsearch<CR><C-L>
endif

" Search and replace.
nmap <Leader>r :%s//<Left><Left>

" Buffer handling
" nmap L :let &number=1-&number<CR>
" nmap <leader>l :bnext<CR>
" nmap <c-h> :bprevious<CR>
" nmap <leader>bq :bp <BAR> bd #<CR>
" nmap <leader>bl :ls<CR>
" nmap <leader>0 :set invnumber<CR>

" map :q to byffer delete
" http://stackoverflow.com/questions/7513380/vim-change-x-function-to-delete-buffer-instead-of-save-quit
cnoreabbrev <expr> q getcmdtype() == ":" && (getcmdline() == 'q' && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) > 1) ? 'bd' : 'q'

" Open NERDTree navigation window.
nmap <Leader>nt :NERDTreeToggle<CR>

" Autoformat.
nnoremap <Leader>af :Autoformat<CR>
vnoremap <Leader>af :Autoformat<CR>

" Toggle between windows.
nnoremap <Leader><Left> <C-W>h
nnoremap <Leader><Right> <C-W>l
nnoremap <Leader><Down> <C-W>j
nnoremap <Leader><Up> <C-W>k
