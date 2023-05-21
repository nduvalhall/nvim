require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'lua_ls',
        'tsserver',
        'pyright',
        'rust_analyzer',
        'marksman',
        'clangd',
        'julials',
    }
})
require('mason-null-ls').setup({
    ensure_installed = {
        'prettier',
        'black',
    }
})

-- format on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
local null_ls = require('null-ls')
local sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.black,
}
null_ls.setup({
    sources = sources,
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(_, _)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'go', vim.lsp.buf.type_definition, {})
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, {})
    vim.keymap.set('n', 'gl', vim.diagnostic.open_float, {})
end


require('lspconfig').lua_ls.setup {
    on_attach = on_attach,
    capabilites = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim'
                },
            },
        },
    },
}

require('lspconfig').tsserver.setup {
    on_attach = on_attach,
    capabilites = capabilities,
}

require('lspconfig').pyright.setup {
    on_attach = on_attach,
    capabilites = capabilities,
}

require('lspconfig').rust_analyzer.setup {
    on_attach = on_attach,
    capabilites = capabilities,
}

require('lspconfig').marksman.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig').clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig').taplo.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}
