return {
    -- Mason
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- Mason LSP config
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                automatic_installation = true,
                ensure_installed = {},
            })
        end,
    },

    -- LSP config
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim"
        },
        config = function()
            local lspconfig = require('lspconfig')
            local servers = { 'ts_ls', 'lua_ls', 'pyright', 'rust_analyzer', 'gopls' }
            for _, server in ipairs(servers) do
                if pcall(require, 'lspconfig.server_configurations.' .. server) then
                    lspconfig[server].setup({})
                end
            end
        end,
    },
}
