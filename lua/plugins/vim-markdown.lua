-- function for mapping "o" in markdown
local function mapf_o()
    if vim.o.filetype == "markdown" then
        return 'A<cr>'
    end
    return 'o'
end
-- function for mapping "<enter>" in markdown
local function mapf_cr()
    local line = vim.fn.getline(".")
    if vim.o.filetype == "markdown" and string.match(line,"^%s+-%s+$") then
        return ' <bs><esc><<A'
    elseif vim.o.filetype == "markdown" and (string.match(line,"^-%s*$") or string.match(line,"^%s+$")) then
        return '<esc>0DA'
    elseif vim.o.filetype == "markdown" and (string.match(line,"^%s*-$")) then
        return '<esc><<A '
    end
    return '<enter>'
end

return {
    'preservim/vim-markdown',
    ft = "markdown",
    dependencies = {'godlygeek/tabular'},
    keys = {
        {'<leader><leader>mp','<cmd>MarkdownPreviewToggle<cr>', mode = "i", desc = "mardkown"},
        {'<leader><leader>i',"<img src='./IMG' align=center width=100%/><esc>F'i", mode = "i", desc = "mardkown"},
        {'<leader>mp','<cmd>MarkdownPreviewToggle<cr>', desc = "mardkown"},
        {'<leader>i', "i<img src='./IMG' align=center width=100%/><esc>F'i", desc = "mardkown"},
        {'<leader>mc',"<cmd>lua HH_CustomCssFile()<cr>", desc = "mardkown"},
        {'gl-',"^i- <esc>", desc = "mardkown"},
        {'gl1',"^i1. <esc>", desc = "mardkown"},
        {'gl ',"^a <esc>$", desc = "mardkown"},
        {'<leader>mr',"<cmd>r ~/AppData/Local/nvim/lua/css_markdown/AutoNumber-ForFile.md<cr>", desc = "mardkown"},
        {'<leader>mq',"lT|dt|i", desc = "mardkown"},
        {'<leader>mt',"<cmd>Tabularize /|/l0<cr>", desc = "mardkown"},
        -- map o when markdown file as insert at line end
        -- When list with no content enter will remove a tab. If no tab will remove list.
    },
    config = function ()
        vim.g.vimwiki_global_ext = 0
        vim.cmd("highlight @markup.strong guifg=#ea88aa  gui=bold")
        vim.cmd("highlight @markup.italic guifg=#ea88aa gui=italic")
        vim.cmd("highlight @markup.strikethrough guifg=#5a6e8e gui=underline,strikethrough")
        vim.cmd("highlight @markup.inline guifg=#bfa99f")
        vim.o.conceallevel=2
        vim.o.foldmethod="expr"
        vim.g.mkdp_theme = 'light'
        -- Toggle Custom Css file
        vim.keymap.set('n', 'o', mapf_o, { expr = true })
        vim.keymap.set('i', '<enter>',mapf_cr, { expr = true })
        function HH_CustomCssFile()
            if vim.g.mkdp_markdown_css == nil or vim.g.mkdp_markdown_css == "" then
                vim.g.mkdp_markdown_css = "C:\\Users\\honghao\\AppData\\Local\\nvim\\lua\\css_markdown\\AutoNmber-ForCustomCSS.css";
            else
                vim.g.mkdp_markdown_css = "";
            end
            vim.cmd([[MarkdownPreviewToggle]])
        end
    end,
}
