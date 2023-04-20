
local map = vim.keymap.set
map('n','<leader>mo','<cmd>MarkdownPreviewToggle<cr>')
map('n','<leader>i',"i<img src='./IMG' align=center width=100%/><esc>F'i/")
map('i','<leader><leader>i',"<img src='./IMG' align=center width=100%/><esc>F'i/")
vim.g.mkdp_theme = 'light'
