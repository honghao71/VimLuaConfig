-- lua/plugins/telescope-zoxide.lua
return {
  "jvgrootveld/telescope-zoxide",
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("telescope").load_extension("zoxide")
    -- vim.keymap.set("n", "<leader>cd", require("telescope").extensions.zoxide.list)
  end
}
