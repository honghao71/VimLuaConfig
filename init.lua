require('settings')
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require('settingsLast')
require("lazy").setup({
    spec = {
        {import = "plugins"},
        {import = "plugins.lsp"},
    }
})
-- Plugins setting
-- require('plugconfig.nvim-web-devicons')
-- require('plugconfig.OneDark')
-- require('plugconfig.lualine')
-- require('plugconfig.treesitter')
-- require('plugconfig.hop')
-- require('plugconfig.colorful-winsep')
-- require('plugconfig.comment')
-- require('plugconfig.hlchunk')
-- require('plugconfig.vim-markdown')
-- require('plugconfig.lsp.cmp-nvim-lsp')
-- require('plugconfig.lsp.nvim-cmp')
-- require('plugconfig.lsp.nvim-lspconfig')
-- require('plugconfig.lsp.mason')
-- require('plugconfig.nvim-tree')
-- require('plugconfig.telescope')
-- require('plugconfig.vsnip')
-- require("nvim-surround").setup()
-- require('mini.align').setup()
-- Will error if use below. Different require in packger plugins.lua
-- require('dashboard')
