return {
  "hrsh7th/cmp-nvim-lsp",
--   event = "InsertEnter",
--   config = function()
--     -- Fetch the default LSP capabilities from cmp_nvim_lsp
--     local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
--     -- ✅ Correct way: Use setup() with a table of server configurations
--     require('vim.lsp.config').setup({
--       lua_ls = {
--         capabilities = capabilities,
--         -- Optional: add on_attach, settings, etc.
--         -- on_attach = on_attach,
--         -- settings = { ... }
--       },
--       powershell_es = {
--         capabilities = capabilities,
--         -- other options...
--       }
--     })
--   end,
}
