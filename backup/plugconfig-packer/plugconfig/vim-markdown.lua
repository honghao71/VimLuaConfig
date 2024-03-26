
-- vim.o.conceallevel=2
-- vim.o.concealcursor="nc"
local map = vim.keymap.set
-- let vimwiki don't set filetype to vimwiki for markdown
vim.g.vimwiki_global_ext = 0
vim.cmd("highlight @markup.strong guifg=#ea88aa  gui=bold")
vim.cmd("highlight @markup.italic guifg=#ea88aa gui=italic")
vim.cmd("highlight @markup.strikethrough guifg=#5a6e8e gui=underline,strikethrough")
vim.cmd("highlight @markup.inline guifg=#bfa99f")
vim.o.conceallevel=2

map('n','<leader>mp','<cmd>MarkdownPreviewToggle<cr>')
map('i','<leader><leader>mp','<cmd>MarkdownPreviewToggle<cr>')
map('n','<leader>i',"i<img src='./IMG' align=center width=100%/><esc>F'i")
map('i','<leader><leader>i',"<img src='./IMG' align=center width=100%/><esc>F'i")
map('n','<leader>mc',"<cmd>lua HH_CustomCssFile()<cr>")
map('n','gl-',"^i- <esc>")
map('n','gl1',"^i1. <esc>")
map('n','gl ',"^a <esc>$")
map('n','<leader>mr',"<cmd>r ~/AppData/Local/nvim/lua/css_markdown/AutoNumber-ForFile.md<cr>")
map('n','<leader>mt',"<cmd>s/\\v\\t/|/g<cr>I|<esc>A|||<esc><cmd>nohl<cr>")
map('n','<leader>mq',"vip:s/\\v\\s+\\|/\\|/g<cr><cmd>nohl<cr>")
-- map o when markdown file as insert at line end
map('n', 'o',
    function()
        if vim.o.filetype == "markdown" then
            return 'A<cr>'
        end
        return 'o'
    end,
    { expr = true }
    )
-- When list with no content enter will remove a tab. If no tab will remove list.
map('i', '<enter>',
    function()
        local line = vim.fn.getline(".")
        if vim.o.filetype == "markdown" and string.match(line,"^%s+-%s+$") then
            return ' <bs><esc><<A'
        elseif vim.o.filetype == "markdown" and (string.match(line,"^-%s*$") or string.match(line,"^%s+$")) then
            return '<esc>0DA'
        elseif vim.o.filetype == "markdown" and (string.match(line,"^%s*-$")) then
            return '<esc><<A '
        end
        return '<enter>'
    end,
    { expr = true }
    )

vim.g.mkdp_theme = 'light'
-- Toggle Custom Css file
function HH_CustomCssFile()
    if vim.g.mkdp_markdown_css == nil or vim.g.mkdp_markdown_css == "" then
        vim.g.mkdp_markdown_css = "C:\\Users\\honghao\\AppData\\Local\\nvim\\lua\\css_markdown\\AutoNmber-ForCustomCSS.css";
    else
        vim.g.mkdp_markdown_css = "";
    end
    vim.cmd([[MarkdownPreviewToggle]])
end

