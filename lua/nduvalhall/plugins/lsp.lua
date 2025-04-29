return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
            library = {
                { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
            },
        },
    },
    config = function()
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

        vim.api.nvim_create_autocmd('LspAttach', {
            callback = function()
                vim.keymap.set('n', 'K', vim.lsp.buf.hover)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration)
                vim.keymap.set('n', 'gl', vim.diagnostic.open_float)
            end,
        })
    end,
}
