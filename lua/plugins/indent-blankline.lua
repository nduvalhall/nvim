require("indent_blankline").setup {
    char = "│",
    buftype_exclude = { "terminal" },
    show_trailing_blankline_indent = false,
    show_first_indent_level = true,
    show_current_context = false,
    context_patterns = {
        "class",
        "function",
        "method",
        "^if",
        "^while",
        "^for",
        "^object",
        "^table",
        "block",
        "arguments",
        "if_statement",
        "else_clause",
        "jsx_element",
        "jsx_self_closing_element",
        "try_statement",
        "catch_clause",
        "import_statement",
        "operation_type",
    },

    char_highlight_list = {
        "IndentBlankLineIndent",
    },
}

vim.cmd [[highlight IndentBlanklineIndent guifg=#44475a gui=nocombine]]
