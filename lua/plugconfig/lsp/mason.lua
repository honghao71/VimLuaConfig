
require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
    PATH = "prepend", -- "skip" seems to cause the spawning error
})
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "html","jsonls","ltex","powershell_es","pyright" },
}
