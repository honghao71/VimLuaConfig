return {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
        require('hlchunk').setup({
            chunk = {
                enable = true,
                support_filetypes = {
                    "*.ts",
                    "*.tsx",
                    "*.js",
                    "*.jsx",
                    "*.html",
                    "*.json",
                    "*.go",
                    "*.c",
                    "*.cpp",
                    "*.rs",
                    "*.h",
                    "*.hpp",
                    "*.lua",
                    "*.vue",
                    "*.md",
                },
                chars = {
                    horizontal_line = "─",
                    vertical_line = "│",
                    left_top = "╭",
                    left_bottom = "╰",
                    right_arrow = ">",
                },
                style = "#00ffff",
            },

            indent = {
                enable = true,
                use_treesitter = false,
                -- You can uncomment to get more indented line look like
                chars = {
                    "│",
                },
                -- you can uncomment to get more indented line style
                style = {
                    vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
                },
                exclude_filetype = {
                    dashboard = true,
                    help = true,
                    lspinfo = true,
                    packer = true,
                    checkhealth = true,
                    man = true,
                    mason = true,
                    NvimTree = true,
                    plugin = true,
                },
            },

            line_num = {
                enable = true,
                support_filetypes = {

                },
                style = "#af4f4c",
            },

            blank = {
                enable = true,
                chars = {
                    "󰹫",
                },
                style = {
                    vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
                },
                exclude_filetype = {
                    dashboard = true,
                    help = true,
                    lspinfo = true,
                    packer = true,
                    checkhealth = true,
                    man = true,
                    mason = true,
                    NvimTree = true,
                    plugin = true,
                },
            },
        })
    end,
}
