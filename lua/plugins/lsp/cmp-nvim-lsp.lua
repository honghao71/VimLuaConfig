return {
    "hrsh7th/cmp-nvim-lsp",
    event = "InsertEnter",
    config = function ()
        -- require'cmp'.setup {
        --   sources = {
        --     { name = 'nvim_lsp' }
        --   }
        -- }

        -- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        -- The following example advertise capabilities to `clangd`.
        require'lspconfig'.lua_ls.setup {
         capabilities = capabilities,
        }
        require'lspconfig'.powershell_es.setup {
         capabilities = capabilities,
        }
    end,
}
