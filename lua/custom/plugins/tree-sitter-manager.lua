return {
    'romus204/tree-sitter-manager.nvim',
    config = function()
        require('tree-sitter-manager').setup({
            ensure_installed = {
                'python',
                'lua',
                'ocaml',
                'rust',
                'typescript',
                'javascript',
                'vue',
                'yaml',
                'toml',
                'json',
                'bash',
                'make',
                'just',
            },
            languages = {
                tbd = {
                    install_info = {
                        url = 'https://github.com/tbd-lang/tree-sitter-tbd',
                        use_repo_queries = true,
                    },
                },
            },
        })
    end,
}
