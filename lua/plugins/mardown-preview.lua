return {
    -- install without yarn or npm
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        -- build = function() vim.fn["mkdp#util#install"]() end,
        config = function()
            vim.g.mkdp_auto_start = 1
            vim.g.mkdp_auto_open = 1
          end,
    }
}
