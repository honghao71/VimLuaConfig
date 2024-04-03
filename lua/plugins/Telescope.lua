return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    event = "VeryLazy",
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
        {"<leader>fk","<cmd>Telescope keymaps<cr>", desc = "telescope"},
        {"<leader>ff","<cmd>Telescope find_files<cr>", desc = "telescope"},
        {"<leader>fv","<cmd>Telescope vim_options<cr>", desc = "telescope"},
        {"<leader>fo","<cmd>Telescope oldfiles<cr>", desc = "telescope"},
        {"<leader>fh","<cmd>Telescope highlights<cr>", desc = "telescope"},
        {"<leader>fw",":Telescope", desc = "telescope"},
    },
    config = function ()
        require('telescope').setup{
            defaults={
                prompt_prefix = "8=> "
            }
        }
    end,
}
