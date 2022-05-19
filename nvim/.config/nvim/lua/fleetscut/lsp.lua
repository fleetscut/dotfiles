local nvim_lsp = require("lspconfig")
local saga = require('lspsaga')

local sumneko_root_path = vim.fn.getenv("HOME").."/dev/lua/lua-language-server"
local sumneko_binary = sumneko_root_path.. '/bin/Linux/lua-language-server'

--local capabilities = vim.lsp.protocol.make_client_capabilities()
--local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local settings = require("fleetscut.settings")

local on_attach = settings.on_attach
local capabilities = settings.capabilities

cfg = {
    log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log",
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    -- If you want to hook lspsaga or other signature handler, pls set to false
    doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
    -- set to 0 if you DO NOT want any API comments be shown
    -- This setting only take effect in insert mode, it does not affect signature help in normal
    -- mode, 10 by default

    floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
    fix_pos = true,  -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = true, -- virtual hint enable
    hint_prefix = "🐼 ",  -- Panda for parameter
    hint_scheme = "String",
    hi_parameter = "Search", -- how your parameter will be highlight
    max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
    -- to view the hiding contents
    max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    handler_opts = {
        border = "shadow"   -- double, single, shadow, none
    },
    extra_trigger_chars = {} -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
}

require'lsp_signature'.setup(cfg)

saga.init_lsp_saga()

--vim.cmd(([[ autocmd FileType java lua require('jdtls').start_or_attach({ cmd = {'java-lsp.sh'}, on_attach = on_attach }) ]]))
vim.cmd(([[ autocmd FileType java lua require('fleetscut.jdtls_setup').start_jdt() ]]))
require('jdtls.ui').pick_one_async = require('lspsaga')

local finders = require'telescope.finders'
local sorters = require'telescope.sorters'
local actions = require'telescope.actions'
local pickers = require'telescope.pickers'
require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
    local opts = {}
    pickers.new(opts, {
        prompt_title = prompt,
        finder    = finders.new_table {
            results = items,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = label_fn(entry),
                    ordinal = label_fn(entry),
                }
            end,
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(function()
                local selection = actions.get_selected_entry(prompt_bufnr)
                actions.close(prompt_bufnr)

                cb(selection.value)
            end)

            return true
        end,
    }):find()
end

nvim_lsp.pyright.setup{ on_attach = on_attach, capabilities = capabilities}
nvim_lsp.tsserver.setup{
    on_attach = on_attach,
    capabilities = vim.lsp.protocol.make_client_capabilities()
}
nvim_lsp.clangd.setup{ 
    on_attach = on_attach,
    capabilities = capabilities
}
nvim_lsp.vuels.setup{ 
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = true
        on_attach(client) 
    end,
    capabilities = capabilities,
    settings = {
        vetur = {
            completion = {
                autoImport = true,
                useScaffoldSnippets = true
            },
            format = {
                defaultFormatter = {
                    html = "none",
                    js = "prettier",
                    ts = "prettier",
                }
            },
            validation = {
                template = true,
                script = true,
                style = true,
                templateProps = true,
                interpolation = true
            },
            experimental = {
                templateInterpolationService = true
            }
        }
    }
}

nvim_lsp.sumneko_lua.setup{
    cmd = { sumneko_binary, '-E', sumneko_root_path .. '/main.lua' },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';'),
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { 'vim' },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file('', true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}



vim.opt.completeopt = {"menu","menuone","noselect"}

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
            -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
            -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
    },
    mapping = {
      ['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i','c'}),
      ['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i','c'}),
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    }),
    -- experimental = {
    --     native_menu = false,
    --
    -- }
})

