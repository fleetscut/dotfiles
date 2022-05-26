" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files({hidden=true})<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>
"nnoremap <leader>fe <cmd>lua require('telescope.extensions.file_browser').file_browser()<cr>
nnoremap <leader>fe <cmd>lua require "telescope".extensions.file_browser.file_browser()<cr>
nnoremap <leader>fd <cmd>lua require "telescope.builtin".diagnostics()<cr>

