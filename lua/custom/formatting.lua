local formatters = {
    stylua = {
        filetypes = { 'lua' },
        cmds = { { 'stylua' } },
    },
    ruff = {
        filetypes = { 'python' },
        cmds = {
            { 'ruff', 'check', '--fix' },
            { 'ruff', 'check', '--select', 'I', '--fix' },
            { 'ruff', 'format' },
        },
    },
    prettier = {
        filetypes = { 'javascript', 'typescript', 'json', 'vue', 'svelte', 'markdown', 'yaml' },
        cmds = { { 'prettier', '--write' } },
    },
    ocamlformat = {
        filetypes = { 'ocaml' },
        cmds = { { 'ocamlformat', '--enable-outside-detected-project', '--inplace' } },
    },
}

local exists = function(e, l)
    for _, _e in pairs(l) do
        if e == _e then
            return true
        end
    end
    return false
end

vim.api.nvim_create_autocmd('BufWritePost', {
    callback = function(args)
        local ft = vim.bo[args.buf].filetype
        local filepath = args.file

        for _, f in pairs(formatters) do
            if exists(ft, f.filetypes) then
                for _, cmd in pairs(f.cmds) do
                    if vim.fn.executable(cmd[1]) == 1 then
                        table.insert(cmd, filepath)
                        vim.system(cmd, { text = true }):wait()
                    end
                end
                vim.cmd('edit')
            end
        end
    end,
})
