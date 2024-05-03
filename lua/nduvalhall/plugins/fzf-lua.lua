return {
    "ibhagwan/fzf-lua",
    config = function()
        require("fzf-lua").setup({ "telescope" })

        local fzf = require("fzf-lua")
        vim.keymap.set("n", "<leader>fb", fzf.builtin, { desc = "[F]ind [B]uiltin" })

        -- files
        vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "[F]ind [F]iles" })
        vim.keymap.set("n", "<leader>fr", fzf.resume, { desc = "[F]ind [F]iles" })
        vim.keymap.set("n", "<leader>fs", fzf.grep, { desc = "[F]ind [S]tring" })
        vim.keymap.set("n", "<leader>fc", fzf.grep_cword, { desc = "[F]ind string under [C]ursor" })
        vim.keymap.set("n", "<leader>fdd", fzf.diagnostics_document, { desc = "[F]ind [D]iagnostics [D]ocument" })
        vim.keymap.set("n", "<leader>fdw", fzf.diagnostics_workspace, { desc = "[F]ind [D]iagnostics [W]orkspace" })
        vim.keymap.set("n", "<leader><leader>", fzf.buffers, { desc = "[F]ind [B]uffers" })

        -- git
        vim.keymap.set("n", "<leader>gf", fzf.git_files, { desc = "[F]ind [G]it [F]iles" })
        vim.keymap.set("n", "<leader>gb", fzf.git_branches, { desc = "[F]ind [G]it [B]ranches" })
        vim.keymap.set("n", "<leader>gs", fzf.git_status, { desc = "[F]ind [G]it [S]tatus" })

        -- lsp
        vim.keymap.set("n", "gi", fzf.lsp_implementations, { desc = "[F]ind [G]oto [I]mplementations" })
        vim.keymap.set("n", "gr", fzf.lsp_references, { desc = "[G]oto [R]eferences" })
        vim.keymap.set("n", "gd", fzf.lsp_definitions, { desc = "[G]oto [D]efinition" })
        vim.keymap.set("n", "gD", fzf.lsp_declarations, { desc = "[G]oto [D]eclarations" })
        vim.keymap.set("n", "gt", fzf.lsp_typedefs, { desc = "[G]oto [D]eclarations" })
        vim.keymap.set("n", "ga", fzf.lsp_code_actions, { desc = "[C]ode [A]ctions" })

        -- misc
        vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "[F]ind [H]elp" })
        vim.keymap.set("n", "<leader>ft", fzf.colorschemes, { desc = "[F]ind [T]hemes" })
    end
}
