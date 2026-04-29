return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = "VeryLazy",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    -- NvimTree Mappings
    keys = {
        {"<leader>tt","<cmd>NvimTreeToggle C:\\Users\\honghao\\AppData\\Local\\nvim\\<cr>", desc = "NvimTree nvim setting"},
        {"<leader>tn","<cmd>NvimTreeToggle D:\\文档\\内贸\\需求\\<cr>", desc = "NvimTree needs"},
        {"<leader>tp","<cmd>NvimTreeToggle D:\\Documents\\PowerShell<cr>", desc = "NvimTree pwsh setting"},
        {"<leader>tf","<cmd>NvimTreeFindFile!<cr>", desc = "NvimTree current file directory"},
        {"<leader>t.","<cmd>NvimTreeToggle .\\<cr>", desc = "NvimTree current path directory"},
    },
    config = function()
        -- disable netrw at the very start of your init.lua (strongly advised)
        vim.g.loaded_netrw = 1
        vim.g.loaded_netrwPlugin = 1
        -- set termguicolors to enable highlight groups
        vim.opt.termguicolors = true
        require("nvim-tree").setup {
            sort_by = "case_sensitive",
            root_dirs = {"~/AppData/Local/nvim/"},
            prefer_startup_root = true,
            renderer = {
                group_empty = true,
            },
            git = {
                enable = true,
                ignore = true,
                show_on_dirs = true,
                show_on_open_dirs = true,
                timeout = 400,
            },
            filters = {
                dotfiles = true,
            },
        }
    end,
}
