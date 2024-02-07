-- common settings
local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.ignorecase = true
opt.smartcase = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.cursorcolumn = true
opt.splitbelow = true
opt.linebreak = true
opt.colorcolumn = { "80" }
opt.scrolloff = 3

vim.g.mapleader = ' '

-- common mappings
local map = vim.keymap.set
-- Mapping in normal
map('n','<leader>w',"<cmd>w<cr>")
map('n','<A-j>','<C-W>j')
map('n','<A-k>','<C-W>k')
map('n','<A-h>','<C-W>h')
map('n','<A-l>','<C-W>l')
map('n','<leader>r','"*')
map('n','<leader>dw','F(df A')
map('n','Y','y$')
map('n','<leader>h','^')
map('n','<leader>l','$')
map('n','<leader>p','"*p')
map('n','<leader>y','"*yy')
map('n','<leader>sp','<cmd>set spell!<cr>')
map('n','<leader>jf', ':%!python -m json.tool<cr>:set foldmethod=indent<cr>:set filetype=json<cr>')-- formant json file
map('n','<leader>edi',":%s/'/'\r/g<cr>:nohl<cr>:set filetype=edi<cr>gg")-- for edi file add return behind ' and set file type
map('n','<leader>c', '^f求la完成<Bslash><esc>za')-- for work needs item to complete folder
map('n','<leader>co',"da':let b:pu=trim(execute(<c-r><c-r>"..'"))<bar>pu='.."'[' .. b:pu .. ']' <bar>unlet b:pu<cr>kgJf]")-- execute command in '' deleted it and put return message in []
map('n','<leader>,','/<,++><cr>:nohlsearch<cr>ca<<bs>')
map('n','<a-<>','<c-w><')
map('n','<a->>','<c-w>>')
map('n','<a-->','<c-w>-')
map('n','<a-=>','<c-w>+')
map('n','<leader>wx','0f[lrx')
map('n','<leader>fn','a<c-r>=expand("%:t:r")<cr><esc>')-- Insert filename without ex

-- Mapping in insert
map('i','jj','<esc>')
map('i','""','"" <,++><esc>6hi')
map('i',"''","'' <,++><esc>6hi")
map('i','((','() <,++><esc>6hi')
map('i','{{','{} <,++><esc>6hi')
map('i','[[','[] <,++><esc>6hi')
map('i','$$','$$ <,++><esc>6hi')
map('i','<<','<> <,++><esc>6hi')
map('i','<leader><leader>p','<esc>"*p')

map('i','<leader> <,++>','<> <,++><esc>6hi')
map('i','<leader>,','<esc>/<,++><cr>:nohlsearch<cr>ca<<bs>')
map('i','<leader><leader>w',"<cmd>w<cr>")
map('i','<leader><leader>dw','<esc>F(df A')-- to delete (星期X) which paste from mail time
map('i','<leader><leader>fn','<c-r>=expand("%:t:r")<cr>')-- Insert filename without ex

-- Key abbreviate
vim.cmd('iab timex <C-r>=strftime("%Y-%m-%d %H:%M")<cr>')
vim.cmd('iab datex <C-r>=strftime("%Y-%m-%d")<cr>')
