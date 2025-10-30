return{
    "neovim/nvim-lspconfig",
    event = "VeryLazy",
    config = function ()
        -- Setup language servers.
        -- local lspconfig = require('lspconfig')
        -- local on_attach = require'lspconfig'.on_attach
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities.textDocument.completion.completionItem.snippetSupport = true
        -- lspconfig.lua_ls.setup {}
        -- lspconfig.powershell_es.setup {
        --     bundle_path = 'C:\\Users\\honghao\\AppData\\Local\\nvim-data\\mason\\packages\\powershell-editor-services',
        -- }
-- ✅ NEW WAY (Neovim 0.11+)
        vim.lsp.config('*',{
          -- Global LSP settings here (optional)
          capabilities = {capabilities},
          -- ... other global options
        })
    -- 启动 LSP
    vim.lsp.start {
      name = 'lua_ls',
      filetypes = {'lua'},
      cmd = { 'lua-language-server', '--stdio' },
      root_dir = vim.fs.dirname(vim.fs.find({ '?.lua', 'lua' }, { upward = true })[1]),
      capabilities = capabilities,
      on_attach = on_attach,
    }
    vim.lsp.start {
      cmd = { "texlab" }, -- 或直接 "texlab" 如果在 PATH
      filetypes = { "tex", "latex", "bib" },
      settings = {
        texlab = {
          auxDirectory = ".",
          build = {
            executable = "latexmk",
            args = {
              "-pdf",
              "-interaction=nonstopmode",
              "-synctex=1",
              "%f"
            },
            onSave = true,
          },
          chktex = { onOpenAndSave = true },
          lintOnChange = true,
          forwardSearchAfter = true,
        }
    }
}
    vim.lsp.start {
      name = 'powershell_es',
      filetypes = {'ps1'},
      cmd = {
        'pwsh', '-NoLogo', '-NoProfile', '-Command',
        'C:\\Users\\honghao\\AppData\\Local\\nvim-data\\mason\\packages\\powershell-editor-services\\PowerShellEditorServices\\Start-EditorServices.ps1',
        '-BundledModulesPath', 'C:\\Users\\honghao\\AppData\\Local\\nvim-data\\mason\\packages\\powershell-editor-services',
        '-LogPath', "C:/Users/honghao/AppData/Local/nvim-data/lsp.log",
        '-SessionDetailsPath', 'C:/Users/honghao/AppData/Local/nvim-data/session.json',
        '-FeatureFlags', "'{}'",
        '-AdditionalModules', "'{}'",
        '-HostName', "'Neovim'",
        '-HostProfileId', "'nvim'",
      },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git', '*.ps1', '*.psm1' }, { upward = true })[1]),
      capabilities = capabilities,
      on_attach = on_attach,
    }

    vim.lsp.start {
      name = 'html',
      filetypes = {'html','templ'},
      cmd = { 'vscode-html-language-server', '--stdio' },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'index.html' }, { upward = true })[1]),
      capabilities = capabilities,
      on_attach = on_attach,
    }

    vim.lsp.start {
      name = 'marksman',
      filetypes = {'markdown','markdown.mdx'},
      cmd = { 'marksman', 'server' },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'README.md' }, { upward = true })[1]),
      capabilities = capabilities,
      on_attach = on_attach,
    }

    vim.lsp.start {
      name = 'pyright',
      filetypes = {'python'},
      cmd = { 'pyright-langserver', '--stdio' },
      root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'requirements.txt', 'pyproject.toml' }, { upward = true })[1]),
      capabilities = capabilities,
      on_attach = on_attach,
    }
        -- Then set up individual servers
        -- vim.lsp.start('lua_ls', {})
        -- vim.lsp.start('powershell_es',{bundle_path = 'C:\\Users\\honghao\\AppData\\Local\\nvim-data\\mason\\packages\\powershell-editor-services',})
        -- vim.lsp.start('html', {})
        -- vim.lsp.start('marksman', {})
        -- vim.lsp.start('pyright', {})
        -- lspconfig.rust_analyzer.setup {
        --   -- Server-specific settings. See `:help lspconfig-setup`
        --     settings = {
        --         ['rust-analyzer'] = {},
        --   },
        -- }
        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
        vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
        vim.keymap.set('n', '<leader>td',function ()
            vim.diagnostic.enable(not vim.diagnostic.is_enabled(),{bufnr = 0})
            end)
        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local opts = { buffer = ev.buf }
            vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
            vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
            vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
            vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set('n', '<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
            vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, opts)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
            vim.keymap.set('n', '<leader>f', function()
                vim.lsp.buf.format { async = true }
            end, opts)
            end,
        })
    end,
}
