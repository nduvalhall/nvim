local utils = require("utils")

require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "pyright",
        "clangd",
        "tsserver",
        "vuels",
        "rust_analyzer",
    }
})
require("mason-null-ls").setup({
    ensure_installed = {
        "prettier",
        "black",
    }
})

-- format on save
vim.cmd([[autocmd BufWritePre * lua vim.lsp.buf.format()]])
local null_ls = require("null-ls")
local sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.black,
}
null_ls.setup({
    sources = sources,
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function(_, _)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, {})
    vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
    vim.keymap.set("n", "gl", vim.diagnostic.open_float, {})
end


require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    capabilites = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim"
                },
            },
        },
    },
}
require("lspconfig").pyright.setup {
    on_attach = on_attach,
    capabilites = capabilities,
    before_init = function(_, config)
        local p
        if vim.env.VIRTUAL_ENV then
            p = require("null-ls.utils").path.join(vim.env.VIRTUAL_ENV, "bin", "python3")
        else
            p = utils.find_cmd("python3", ".venv/bin")
        end
        config.settings.python.pythonPath = p
    end,

    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
                disableOrganizeImports = true,
            },
        },
    },
}

require("lspconfig").clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    config = {
        cmd = {
            "clangd",
            "--clang-format-style=file",
        },
    },
}

require("lspconfig").tsserver.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").vuels.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}


require("lspconfig").rust_analyzer.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    config = {
        update_in_insert = true,
    },
}

require("lspconfig").ocamllsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}


local luasnip = require("luasnip")
luasnip.filetype_extend("javascript", { "html" })
luasnip.filetype_extend("javascriptreact", { "html" })
luasnip.filetype_extend("typescriptreact", { "html" })
