source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/keys.vim

lua require("fleetscut")
"augroup lsp
"    au!
"    au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
"augroup end
