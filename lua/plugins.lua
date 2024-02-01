-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
-- Packer can manage itself
    use 'wbthomason/packer.nvim'
-- Directory Tree  
    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
        config = function()
            require("nvim-tree").setup({})
        end
    }
-- Color theme
    use {'navarasu/onedark.nvim'}
-- Statusline
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }
-- syntax treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }
-- Surrounding pairs
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
-- Motion Hop
    use {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended
        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    }
-- Start
    use {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        config = function() require("plugconfig/dashboard") end,
        requires = {'nvim-tree/nvim-web-devicons'}
    }
-- markdown preview
    use { "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end,
        ft = { "markdown" },
    }

    use {'plasticboy/vim-markdown',
        branch = 'master',
        require = {'godlygeek/tabular'},
    }
-- Colorful window seperator
    use {
        "nvim-zh/colorful-winsep.nvim",
        config = function ()
            require('colorful-winsep').setup()
        end
    }
-- Comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
 -- Fuzzy find with telescope
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
      requires = { {'nvim-lua/plenary.nvim'} }
    }
-- Indent with Highlight chunk
    use { "shellRaining/hlchunk.nvim" }
-- Format align
    use { 'echasnovski/mini.align' }
-- Lsp config
    use {
        "williamboman/mason.nvim",
        run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    }
    use { 'williamboman/mason-lspconfig.nvim'}
    use { 'neovim/nvim-lspconfig' }
-- Completion
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' } -- buffer auto-completion
    use { 'hrsh7th/cmp-path' } -- path auto-completion
    use { 'hrsh7th/cmp-cmdline' } -- cmdline auto-completion
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-vsnip' }
    use { 'hrsh7th/vim-vsnip' }
    use { 'hrsh7th/vim-vsnip-integ' }
-- Rainbow2
    use { 'HiPhish/nvim-ts-rainbow2' }
-- dairy
    use { 'ishchow/nvim-deardiary' }
end)
