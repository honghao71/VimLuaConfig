
require('settings')
-- Plugins setting
require('plugins')
require('plugconfig.nvim-web-devicons')
require('plugconfig.nvim-tree')
require('plugconfig.OneDark')
require('plugconfig.lualine')
require('plugconfig.treesitter')
require('plugconfig.hop')
require('plugconfig.colorful-winsep')
require('plugconfig.comment')
require('plugconfig.hlchunk')
require('plugconfig.vim-markdown')
-- Will error if use below. Different require in packger plugins.lua
-- require('plugconfig.dashboard')
require("nvim-surround").setup()
