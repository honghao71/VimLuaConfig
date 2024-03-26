return {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    -- NvimTree Mappings
    keys = {
        {"<leader>tt","<cmd>NvimTreeToggle C:\\Users\\honghao\\AppData\\Local\\nvim\\<cr>", desc = "NvimTree"},
        {"<leader>tn","<cmd>NvimTreeToggle D:\\文档\\内贸\\需求\\<cr>", desc = "NvimTree"},
        {"<leader>tp","<cmd>NvimTreeToggle D:\\software\\pwsh\\<cr>", desc = "NvimTree"},
        {"<leader>tf","<cmd>NvimTreeFindFile!<cr>", desc = "NvimTree"},
        {"<leader>t.","<cmd>NvimTreeToggle .\\<cr>", desc = "NvimTree"},
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
