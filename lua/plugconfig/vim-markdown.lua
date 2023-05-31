
local map = vim.keymap.set
map('n','<leader>mp','<cmd>MarkdownPreviewToggle<cr>')
map('i','<leader><leader>mp','<cmd>MarkdownPreviewToggle<cr>')
map('n','<leader>i',"i<img src='./IMG' align=center width=100%/><esc>F'i")
map('i','<leader><leader>i',"<img src='./IMG' align=center width=100%/><esc>F'i")
map('n','<leader>mc',"<cmd>lua HH_CustomCssFile()<cr>")
map('n','<leader>mr',"<cmd>r ~/AppData/Local/nvim/lua/css_markdown/AutoNumber-ForFile.md<cr>")
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
        if vim.o.filetype == "markdown" and string.match(line,"^%s+-%s*$") then
            return '<esc><<A'
        elseif vim.o.filetype == "markdown" and (string.match(line,"^-%s*$") or string.match(line,"^%s+$")) then
            return '<esc>0DA'
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

