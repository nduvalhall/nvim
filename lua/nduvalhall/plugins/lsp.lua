return {
    'neovim/nvim-lspconfig',
    dependencies = {
        {
            'folke/lazydev.nvim',
            ft = 'lua',
            opts = {
                library = {
                    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
                },
            },
        },
        { 'williamboman/mason.nvim', opts = {} },
        { 'williamboman/mason-lspconfig.nvim' },
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup()

        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local lspconfig = require('lspconfig')

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
        })

        lspconfig.basedpyright.setup({
            capabilities = capabilities,
            analysis = {
                useLibraryCodeForTypes = true,
                autoSearchPaths = true,
                diagnosticMode = 'workspace',
            },
        })

        lspconfig.ocamllsp.setup({
            capabilities = capabilities,
        })

        local mason_packages = vim.fn.stdpath('data') .. '/mason/packages'
        local volar_path = mason_packages .. '/vue-language-server/node_modules/@vue/language-server'
        lspconfig.ts_ls.setup({
            init_options = {
                plugins = {
                    {
                        name = '@vue/typescript-plugin',
                        location = volar_path,
                        languages = { 'vue' },
                    },
                },
            },
            capabilities = capabilities,
            filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
        })

        lspconfig.volar.setup({})

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function()
                vim.keymap.set('n', 'K', vim.lsp.buf.hover)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
                vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
            end,
        })

        vim.diagnostic.config({
            virtual_lines = {
                current_line = true,
            },
        })
    end,
}
