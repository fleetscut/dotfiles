nnoremap <leader>u :UndotreeToggle<CR>
" nnoremap <leader>pv :wincmd v<bar> :EX <bar> :vertical resize 30<CR>
" nnoremap <leader> ps :Rg<SPACE>
" nnoremap <silent> <leader>+ :vertical resize +5<CR>
" nnoremap <silent> <leader>- :vertical resize -5<CR>
"
"Tabs
"nnoremap <leader>n <esc>:tabprevious<CR>
"nnoremap <leader>m <esc>:tabnext<CR>

"Splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Split resize
nnoremap <M-j> :resize -2<CR>
nnoremap <M-k> :resize +2<CR>
nnoremap <M-h> :vertical resize -2<CR>
nnoremap <M-l> :vertical resize +2<CR>

" Replace Escape
inoremap <C-c> <Esc>

" Better tabbing
vnoremap < <gv
vnoremap > >gv

"Nerdtree
"nnoremap <silent><leader>b :NERDTreeToggle<CR>

"Table Mode
nnoremap <leader>t :TableModeToggle<CR>

nnoremap <leader>pv :Ex<CR>

nmap <leader>py <Plug>(Prettier)

"Use black hole register
xnoremap <leader>p "_ddP
nnoremap <leader>d "_dd
vnoremap <leader>d "_dd

nnoremap <leader>o o<C-c>
nnoremap <leader>O O<C-c>j


"Yank to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

"Yank whole file
nnoremap <leader>Y gg"+yG

"Move selected lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
