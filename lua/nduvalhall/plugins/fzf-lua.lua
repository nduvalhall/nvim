return {
    'ibhagwan/fzf-lua',
    config = function()
        local fzf = require('fzf-lua')
        fzf.setup({ 'telescope' })

        -- files
        vim.keymap.set('n', '<leader>ff', fzf.files)
        vim.keymap.set('n', '<leader>fs', fzf.grep)
        vim.keymap.set('n', '<leader>fc', fzf.grep_cword)
        vim.keymap.set('n', '<leader>fdd', fzf.diagnostics_document)
        vim.keymap.set('n', '<leader>fdw', fzf.diagnostics_workspace)
        vim.keymap.set('n', '<leader><leader>', fzf.buffers)

        -- lsp
        vim.keymap.set('n', 'gi', fzf.lsp_implementations)
        vim.keymap.set('n', 'gr', fzf.lsp_references)
        vim.keymap.set('n', 'gd', fzf.lsp_definitions)
        vim.keymap.set('n', 'gD', fzf.lsp_declarations)
        vim.keymap.set('n', 'gt', fzf.lsp_typedefs)
        vim.keymap.set('n', 'ga', fzf.lsp_code_actions)
    end,
}
