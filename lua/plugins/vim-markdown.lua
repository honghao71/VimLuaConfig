-- function for mapping "o" in markdown
function HH_mapf_o ()
    local line = vim.fn.getline(".")
    local line_number = vim.fn.line(".")
    local insert
    local indent, number , text= string.match(line,"^(%s*)(%d)(%..*)$")
    local indent_l, list = string.match(line,"^(%s*)([-*]).*$")
    if vim.o.filetype == "markdown" and number then
        local next_number = number+1
        insert = indent .. next_number .. ". "
        vim.fn.append(line_number, insert)
        vim.fn.cursor(line_number+1,vim.fn.col("$"))
        vim.api.nvim_feedkeys('A','n',true)
    elseif vim.o.filetype == "markdown" and list then
        insert = indent_l .. list .. " "
        vim.fn.append(line_number, insert)
        vim.fn.cursor(line_number+1,vim.fn.col("$"))
        vim.api.nvim_feedkeys('A','n',true)
    else
        vim.api.nvim_feedkeys('o','n',true)
    end
end
-- function for mapping "<enter>" in markdown
local function mapf_cr()
    local line = vim.fn.getline(".")
    if vim.o.filetype == "markdown" and (string.match(line,"^%s+[-*]%s+$") or string.match(line,"^%s+%d%.%s+$"))then
        return ' <bs><esc><<A'
    elseif vim.o.filetype == "markdown" and (string.match(line,"^[-*]%s*$") or string.match(line,"^%d%.%s*$") or string.match(line,"^%s+$")) then
        return '<esc>0DA'
    elseif vim.o.filetype == "markdown" and (string.match(line,"^%s*[-*]$") or string.match(line,"^%s*%d%.$")) then
        return '<esc><<A '
    elseif vim.o.filetype == "markdown" and (string.match(line,"^%s+[-*]%s+.+$") or string.match(line,"^%s+%d%.%s+.+$"))then
        return '<esc><cmd>=HH_mapf_o()<cr>'
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
        {'gl-',"^i- <esc>", desc = "mardkown change to - list"},
        {'gl1',"^i1. <esc>", desc = "mardkown change to number list"},
        {'gl ',"^a <esc>$", desc = "mardkown add space behind fist charactor"},
        {'<leader>mr',"<cmd>r ~/AppData/Local/nvim/lua/css_markdown/AutoNumber-ForFile.md<cr>", desc = "mardkown"},
        {'<leader>mq',"lT|dt|i", desc = "mardkown delete between |"},
        {'<leader>mt',"<cmd>Tabularize /|/l0<cr>", desc = "mardkown format table"},
        -- map o when markdown file as insert at line end
        -- When list with no content enter will remove a tab. If no tab will remove list.
    },
    config = function ()
        vim.g.vimwiki_global_ext = 0
        vim.cmd("highlight @markup.strong guifg=#ea88aa  gui=bold")
        vim.cmd("highlight @markup.italic guifg=#ea88aa gui=italic")
        vim.cmd("highlight @markup.strikethrough guifg=#5a6e8e gui=underline,strikethrough")
        vim.cmd("highlight @markup.inline guifg=#bfa99f")
        vim.cmd("highlight @markup.heading.1.markdown guifg=#4682b4")
        vim.cmd("highlight @markup.heading.1.marker.markdown guifg=#4682b4")
        vim.cmd("highlight @markup.heading.2.markdown guifg=#008b8b")
        vim.cmd("highlight @markup.heading.2.marker.markdown guifg=#008b8b")
        vim.cmd("highlight @markup.heading.3.markdown guifg=#cd5c5c")
        vim.cmd("highlight @markup.heading.3.marker.markdown guifg=#cd5c5c")
        vim.cmd("highlight @markup.heading.4.markdown guifg=#9b9b41")
        vim.cmd("highlight @markup.heading.4.marker.markdown guifg=#9b9b41")
        vim.cmd("highlight @markup.heading.5.markdown guifg=#aa6699")
        vim.cmd("highlight @markup.heading.5.marker.markdown guifg=#aa6699")
        vim.cmd("highlight @markup.heading.6.markdown guifg=#d2691e")
        vim.cmd("highlight @markup.heading.6.marker.markdown guifg=#d2691e")
        local HideTagFont = vim.api.nvim_create_augroup('HideTagFont', { clear = true })
        -- vim.api.nvim_create_autocmd("FileType", {
        --     pattern = { "markdown"},
        --     group = "HideTagFont",
        --     command = "syntax match @fontb \"</\\?font[^<]*>\" conceal cchar=🚩",
        -- })
        vim.o.conceallevel=2
        vim.o.foldmethod="expr"
        vim.g.mkdp_theme = 'light'
        -- Toggle Custom Css file
        vim.keymap.set('n', 'o', '<cmd>=HH_mapf_o()<cr>',{ expr = false })
        vim.keymap.set('i', '<enter>',mapf_cr, { expr = true})
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
