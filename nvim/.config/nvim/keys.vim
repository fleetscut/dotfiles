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

"nvim-tree
nnoremap <silent><leader>n :NvimTreeToggle<CR>

"Table Mode
nnoremap <leader>t :TableModeToggle<CR>

nnoremap <leader>pv :Ex<CR>

nmap <leader>py <Plug>(Prettier)

"Use black hole register
xnoremap <leader>p "_ddP
nnoremap <leader>d "_dd
vnoremap <leader>d "_dd

nnoremap <leader>o o<C-c>k
nnoremap <leader>O O<C-c>j


"Yank to system clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y

"Paste from system clipboard
nnoremap <leader>p "+p
vnoremap <leader>p "+p

"Yank whole file
nnoremap <leader>Y gg"+yG

"Move selected lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"Ranger
let g:ranger_map_keys = 0
"let g:ranger_replace_netrw = 1
map <leader>fr :Ranger<CR>

nnoremap <Leader><CR> :so ~/.config/nvim/init.vim<CR>

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

