-- lua
vim.lsp.config['lua_ls'] = {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    root_markers = { '.git' },
    settings = {
        Lua = {
            hint = { enable = true },
            telemetry = { enable = false },
            diagnostics = { globals = { 'vim' } },
            workspace = {
                checkThirdParty = false,
                library = vim.api.nvim_get_runtime_file('', true),
            },
        },
    },
}

-- python
vim.lsp.config['basedpyright'] = {
    cmd = { 'basedpyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml' },
    settings = {
        basedpyright = {
            pythonPath = vim.fn.expand('.') .. '/.venv/bin/python',
            disableOrganizeImports = true,
            analysis = {
                autoSearchPaths = true,
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = 'workspace',
            },
        },
    },
}

vim.lsp.config['ruff'] = {
    cmd = { 'ruff', 'server' },
    filetypes = { 'python' },
    root_markers = { 'pyproject.toml' },
}

-- vue
local mason_packages = vim.fn.stdpath('data') .. '/mason/packages'
local vue_ls_path = mason_packages .. '/vue-language-server/node_modules/@vue/language-server'
vim.lsp.config['ts_ls'] = {
    filetypes = { 'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue' },
    init_options = {
        plugins = {
            {
                name = '@vue/typescript-plugin',
                location = vue_ls_path,
                languages = { 'vue' },
            },
        },
    },
}
