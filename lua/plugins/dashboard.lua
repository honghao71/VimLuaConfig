return {
    'nvimdev/dashboard-nvim',
    enabled = false,
    event = 'VimEnter',
    config = function()
        local status, db = pcall(require,'dashboard')
        if not status then
            vim.notify("没有找到 dashboard")
            return
        end
        db.setup({
            -- config
            theme = 'doom',
            config = {
                header = {
                    '                                   ',
                    '                                   ',
                    '                                   ',
                    '                                   ',
                    '              ▄▄▄▄▄▄▄▄▄            ',
                    '           ▄█████████████▄          ',
                    '   █████  █████████████████  █████  ',
                    '   ▐████▌ ▀███▄       ▄███▀ ▐████▌  ',
                    '    █████▄  ▀███▄   ▄███▀  ▄█████    ',
                    '    ▐██▀███▄  ▀███▄███▀  ▄███▀██▌    ',
                    '     ███▄▀███▄  ▀███▀  ▄███▀▄███    ',
                    '     ▐█▄▀█▄▀███ ▄ ▀ ▄ ███▀▄█▀▄█▌    ',
                    '      ███▄▀█▄██ ██▄██ ██▄█▀▄███      ',
                    '       ▀███▄▀██ █████ ██▀▄███▀      ',
                    '      █▄ ▀█████ █████ █████▀ ▄█      ',
                    '      ███        ███        ███      ',
                    '      ███▄    ▄█ ███ █▄    ▄███      ',
                    '      █████ ▄███ ███ ███▄ █████      ',
                    '      █████ ████ ███ ████ █████      ',
                    '      █████ ████▄▄▄▄▄████ █████      ',
                    '       ▀███ █████████████ ███▀      ',
                    '         ▀█ ███ ▄▄▄▄▄ ███ █▀        ',
                    '            ▀█▌▐█████▌▐█▀            ',
                    '               ███████              ',
                    '                                   ',
                    '                                   ',
                    '                                   ',
                    '                                   ',
                }, --your header
                center = {
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'Open Nvim-Tree neovim config',
                        desc_hl = 'String',
                        key = 't',
                        key_hl = 'Number',
                        keymap = 'SPC t t',
                        action = 'NvimTreeToggle ~/appdata/local/nvim/'
                    },
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'Open Nvim-Tree Domestic',
                        desc_hl = 'String',
                        key = 'd',
                        key_hl = 'Number',
                        keymap = 'SPC t d',
                        action = 'NvimTreeToggle D:\\文档\\内贸'
                    },
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'Open Nvim-Tree need',
                        desc_hl = 'String',
                        key = 'n',
                        key_hl = 'Number',
                        keymap = 'SPC t n',
                        action = 'NvimTreeToggle D:\\文档\\内贸\\需求'
                    },
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'Open Nvim-Tree PSscript',
                        desc_hl = 'String',
                        key = 'p',
                        key_hl = 'Number',
                        keymap = 'SPC t p',
                        action = 'NvimTreeToggle D:\\software\\pwsh\\'
                    },
                    {
                        icon = ' ',
                        icon_hl = 'Title',
                        desc = 'Find File History',
                        desc_hl = 'String',
                        key = 'f',
                        key_hl = 'Number',
                        keymap = 'SPC f o',
                        action = 'lua require("telescope.builtin").oldfiles()'
                    },
                },
                footer = {"瞎弄一下"}  --your footer
            }
        })
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
