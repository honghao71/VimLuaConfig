-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
	sort_by = "case_sensitive",
	root_dirs = {"~/AppData/Local/nvim/"},
	prefer_startup_root = true,
	renderer = {
		group_empty = true,
	},
    git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        show_on_open_dirs = true,
        timeout = 400,
    },
	filters = {
		dotfiles = true,
	},
})
-- NvimTree Mappings
