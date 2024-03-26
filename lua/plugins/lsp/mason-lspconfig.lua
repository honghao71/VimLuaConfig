return {
    "williamboman/mason-lspconfig.nvim",
    priority = 900,
    config = function ()
        require("mason-lspconfig").setup {
            ensure_installed = { "lua_ls","powershell_es"},
        }
        -- require("lspconfig").lua_ls.setup {}
    end,
}
