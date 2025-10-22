local formatters = {
    stylua = {
        filetypes = { 'lua' },
        cmds = function(filepath)
            return { { 'stylua', '--search-parent-directories', '--stdin-filepath', filepath, '-' } }
        end,
    },
    ruff = {
        filetypes = { 'python' },
        cmds = function(filepath)
            return {
                { 'ruff', 'format', '--stdin-filename', filepath, '-' },
            }
        end,
    },
    prettier = {
        filetypes = { 'javascript', 'typescript', 'json', 'vue', 'svelte', 'markdown', 'yaml' },
        cmds = function(filepath)
            return { { 'prettier', '--stdin-filepath', filepath } } -- reads stdin, writes stdout
        end,
    },
    ocamlformat = {
        filetypes = { 'ocaml' },
        cmds = function(filepath)
            return { { 'ocamlformat', '--enable-outside-detected-project', '--name', filepath, '-' } }
        end,
    },
}

local exists = function(e, l)
    for _, _e in ipairs(l or {}) do
        if e == _e then
            return true
        end
    end
    return false
end

local run_cmd = function(cmd, input)
    local res = vim.system(cmd, { text = true, stdin = input }):wait()
    if res.code == 0 then
        return true, res.stdout or input, ''
    else
        return false, input, (res.stderr or ('command failed: ' .. table.concat(cmd, ' ')))
    end
end

local format_buffer = function(bufnr, ft, filepath)
    local selected
    for _, f in pairs(formatters) do
        if exists(ft, f.filetypes) then
            selected = f
            break
        end
    end
    if not selected then
        return
    end

    local cmds = selected.cmds(filepath)
    if not cmds or #cmds == 0 then
        vim.notify('Formatter is misconfigured (no commands).', vim.log.levels.ERROR)
        return
    end

    local any_exec = false
    for _, c in ipairs(cmds) do
        if vim.fn.executable(c[1]) == 1 then
            any_exec = true
            break
        end
    end
    if not any_exec then
        vim.notify(
            ("No formatter binary found for '%s' (checked: %s)"):format(
                ft,
                table.concat(
                    vim.tbl_map(function(c)
                        return c[1]
                    end, cmds),
                    ', '
                )
            ),
            vim.log.levels.ERROR
        )
        return
    end

    local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
    local text = table.concat(lines, '\n')

    local view = vim.fn.winsaveview()

    local current = text
    for _, c in ipairs(cmds) do
        if vim.fn.executable(c[1]) == 1 then
            local ok, out, err = run_cmd(c, current)
            if not ok then
                vim.fn.winrestview(view)
                vim.notify(('Formatting failed: %s'):format(err:gsub('^%s+', '')), vim.log.levels.ERROR)
                return
            end
            current = out
        end
    end

    if current ~= text then
        local new_lines = vim.split(current, '\n', { plain = true, trimempty = true })
        vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, new_lines)
    end

    vim.fn.winrestview(view)
end

vim.api.nvim_create_autocmd('BufWritePost', {
    callback = function(args)
        if not vim.bo[args.buf].modifiable or vim.bo[args.buf].buftype ~= '' then
            return
        end
        format_buffer(args.buf, vim.bo[args.buf].filetype, args.file)
    end,
})
