"Load plugins
source $HOME/.config/nvim/vim-plug/plugins.vim
"source $HOME/.config/nvim/vim-plug/lsp-config.vim
"source $HOME/.config/nvim/vim-plug/compe-config.lua
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/keys.vim
"source $HOME/.config/nvim/lsp/python-lsp.lua
"source $HOME/.config/nvim/lsp/lsp_signature.lua


lua require("fleetscut")
"augroup lsp
"    au!
"    au FileType java lua require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})
"augroup end
