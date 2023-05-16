
local map = vim.keymap.set
map('n','<leader>mp','<cmd>MarkdownPreviewToggle<cr>')
map('i','<leader><leader>mp','<cmd>MarkdownPreviewToggle<cr>')
map('n','<leader>i',"i<img src='./IMG' align=center width=100%/><esc>F'i")
map('i','<leader><leader>i',"<img src='./IMG' align=center width=100%/><esc>F'i")
map('n','<leader>mc',"<cmd>lua HH_CustomCssFile()<cr>")
map('n','<leader>mr',"<cmd>r ~/AppData/Local/nvim/lua/css_markdown/AutoNumber-ForFile.md<cr>")

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

function Sleep(n)
   local t0 = os.clock()
   while os.clock() - t0 <= n do end
end
