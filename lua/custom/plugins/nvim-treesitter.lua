return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.configs').setup({
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                    disable = { 'dockerfile' },
                },
            })

            local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

            parser_config.menhir = {
                install_info = {
                    url = 'https://github.com/Kerl13/tree-sitter-menhir',
                    files = { 'src/parser.c', 'src/scanner.c' },
                    branch = 'main',
                },
                filetype = 'menhir',
            }

            parser_config.ocamllex = {
                install_info = {
                    url = 'https://github.com/314eter/tree-sitter-ocamllex',
                    files = { 'src/parser.c', 'src/scanner.c' },
                    branch = 'main',
                },
                filetype = 'ocamllex',
            }
        end,
    },
}
