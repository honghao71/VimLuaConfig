return {
    "lervag/vimtex",
    dependencies = {'godlygeek/tabular'},
    lazy = false,     -- we don't want to lazy load VimTeX
  ft = { 'tex', 'latex' },   -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()

-- ~/.config/nvim/lua/vimtex.lua


-- ======================
--  编译器设置 (MiKTeX + latexmk)
-- ======================
vim.g.vimtex_compiler_method = 'latexmk'

vim.g.vimtex_compiler_latexmk = {
  executable = 'latexmk',
  options = {
    '-verbose',
    '-file-line-error',
    '-synctex=1',              -- 启用 SyncTeX 双向同步
    '-interaction=nonstopmode',
    '-xelatex',
    '-outdir="build"'
  },
  -- 可选：将辅助文件放入 build 目录
  out_dir = '.\\build',
    continous=1,
    callback=1
}

-- ======================
--  PDF 查看器：SumatraPDF (Windows 推荐)
-- ======================
vim.g.vimtex_view_method = 'general'
vim.g.vimtex_view_general_view = 'SumatraPDF'

-- SumatraPDF 路径（通常自动找到，若报错请指定完整路径）
vim.g.vimtex_view_sumatrapdf_path = "D:\\scoop\\shims\\sumatrapdf.exe"

vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'

-- 反向搜索：从 PDF 点击跳回 Neovim
-- 这需要在 SumatraPDF 中设置
vim.g.vimtex_inverse_search_cmd = [[nvim --headless -u NORC -c "VimtexInverseSearch %1 %2"]]

-- ======================
--  功能开关
-- ======================
vim.g.vimtex_fold_enabled = 1           -- 启用章节折叠
vim.g.vimtex_matchparen_enabled = 1     -- 括号高亮
vim.g.vimtex_toc_todo_enabled = 1       -- 高亮 TODO
vim.g.vimtex_imaps_enabled = 1          -- 启用插入模式映射
vim.g.vimtex_complete_enabled = 1       -- 补全
vim.g.vimtex_quickfix_mode = 2          -- 编译出错时自动打开 quickfix
vim.g.vimtex_quickfix_open_on_warning = 0

-- ======================
--  键位映射（仅在 tex 文件中生效）
-- ======================

  local keymap = vim.keymap.set
  local opts = { silent = true, noremap = true }

  -- 编译
  keymap('n', '<localleader>ll', '<cmd>VimtexCompile<cr>', opts)
  keymap('n', '<localleader>lo', '<cmd>VimtexCompileOutput<cr>', opts)

  -- 查看 PDF
  keymap('n', '<localleader>lv', '<cmd>VimtexView<cr>', opts)

  -- 停止/清理
  keymap('n', '<localleader>lc', '<cmd>VimtexClean<cr>', opts)
  keymap('n', '<localleader>lk', '<cmd>VimtexStop<cr>', opts)
  keymap('n', '<localleader>lK', '<cmd>VimtexStopAll<cr>', opts)

  -- 目录
  keymap('n', '<localleader>lt', '<cmd>VimtexTocToggle<cr>', opts)

  -- 错误跳转
  keymap('n', ']q', '<cmd>cnext<cr>', opts)
  keymap('n', '[q', '<cmd>cprev<cr>', opts)

  -- 快速输入（插入模式）
  keymap('i', '<localleader>ff', '\\frac{}{}<left><left>', opts)
  keymap('i', '<localleader>ss', '\\sqrt{}<left>', opts)
  keymap('i', '<localleader>bb', '\\left[\\right]<left><left>', opts)
  keymap('i', '<localleader>pp', '\\left(\\right)<left><left>', opts)

end

}
