require("myfunc")
require('settings')
require('vim._core.ui2').enable({
  enable = true, -- Whether to enable or disable the UI.
  msg = { -- Options related to the message module.
    ---@type 'cmd'|'msg' Default message target, either in the
    ---cmdline or in a separate ephemeral message window.
    ---@type string|table<string, 'cmd'|'msg'|'pager'> Default message target
    ---or table mapping |ui-messages| kinds and triggers to a target.
    targets = 'cmd',
    cmd = { -- Options related to messages in the cmdline window.
      height = 0.5 -- Maximum height while expanded for messages beyond 'cmdheight'.
    },
    dialog = { -- Options related to dialog window.
      height = 0.5, -- Maximum height.
    },
    msg = { -- Options related to msg window.
      height = 0.5, -- Maximum height.
      timeout = 4000, -- Time a message is visible in the message window.
    },
    pager = { -- Options related to message window.
      height = 1, -- Maximum height.
    },
  },
})
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
require('settingsLast')

vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
    rocks = {
        hererocks = false,  -- 👈 关键：禁用 hererocks
    },
    spec = {
        {import = "plugins"},
        {import = "plugins.lsp"},
    }
})
if vim.g.neovide then
    local font_size = 12 -- Meslo 稍微大一点比较好
    
    -- 核心修改：字体名称改为 "MesloLGS NF"
    vim.o.guifont = "MesloLGS Nerd Font:h" .. font_size

    function _G.adjust_neovide_font(delta)
        font_size = font_size + delta
        if font_size < 4 then font_size = 4 end
        vim.o.guifont = "MesloLGS Nerd Font:h" .. font_size
    end

    vim.keymap.set('n', '<C-=>', function() _G.adjust_neovide_font(1) end)
    vim.keymap.set('n', '<C-->', function() _G.adjust_neovide_font(-1) end)
    vim.keymap.set('n', '<C-0>', function() font_size = 14; vim.o.guifont = "MesloLGS Nerd Font:h" .. font_size end)
    
    vim.o.showtabline = 0
    vim.g.neovide_hide_mouse_when_typing = true
end

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
