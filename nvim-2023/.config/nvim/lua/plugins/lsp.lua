return {
    "neovim/nvim-lspconfig",
    -- use("ray-x/lsp_signature.nvim")
    {
        "nvimtools/none-ls.nvim",
        dependencies = {
            "nvimtools/none-ls-extras.nvim",
        },
    },
    -- use("nvim-lua/lsp_extensions.nvim")

    -- Java LSP
    "mfussenegger/nvim-jdtls",

    -- Rust
    "simrat39/rust-tools.nvim",
}
