
require('settings')
-- Plugins setting
require('plugins')
require('plugconfig.nvim-web-devicons')
require('plugconfig.OneDark')
require('plugconfig.lualine')
require('plugconfig.treesitter')
require('plugconfig.hop')
require('plugconfig.colorful-winsep')
require('plugconfig.comment')
require('plugconfig.hlchunk')
require('plugconfig.vim-markdown')
require('plugconfig.lsp.cmp-nvim-lsp')
require('plugconfig.lsp.nvim-cmp')
require('plugconfig.lsp.nvim-lspconfig')
require('plugconfig.lsp.mason')
require('plugconfig.nvim-tree')
require('plugconfig.telescope')
require("nvim-surround").setup()
-- Will error if use below. Different require in packger plugins.lua
-- require('plugconfig.dashboard')

require('settingsLast')
