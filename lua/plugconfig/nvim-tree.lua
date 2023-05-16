-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
-- You should use PackerSync after changes, even I don't know why
require("nvim-tree").setup({
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
})
-- NvimTree Mappings
local map = vim.keymap.set
map('n','<leader>tt','<cmd>NvimTreeToggle C:\\Users\\honghao\\AppData\\Local\\nvim\\<cr>')
map('n','<leader>tn','<cmd>NvimTreeToggle D:\\文档\\内贸\\需求\\<cr>')
map('n','<leader>tp','<cmd>NvimTreeToggle D:\\software\\pwsh\\<cr>')
map('n','<leader>tf','<cmd>NvimTreeFindFile!<cr>')
