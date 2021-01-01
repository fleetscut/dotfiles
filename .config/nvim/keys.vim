" nnoremap <leader>h :wincmd h<CR>
" nnoremap <leader>j :wincmd j<CR>
" nnoremap <leader>k :wincmd k<CR>
" nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
" nnoremap <leader>pv :wincmd v<bar> :EX <bar> :vertical resize 30<CR>
" nnoremap <leader> ps :Rg<SPACE>
" nnoremap <silent> <leader>+ :vertical resize +5<CR>
" nnoremap <silent> <leader>- :vertical resize -5<CR>
"
"Tabs
nnoremap <leader>n <esc>:tabprevious<CR>
nnoremap <leader>m <esc>:tabnext<CR>

"Splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
set splitbelow
set splitright

"Nerdtree
nnoremap <silent><leader>n :NERDTreeToggle<CR>

"Table Mode
nnoremap <leader>t :TableModeToggle<CR>

" coc open autocomplete menu
inoremap <silent><expr> <c-space> coc#refresh()

" coc prettier command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

nmap <silent><leader>gd <Plug>(coc-definition)
