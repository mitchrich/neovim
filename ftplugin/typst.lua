    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.textwidth = 0

    -- Up and down screen lines
    vim.keymap.set('n', 'j', 'gj', { buffer = true, silent = true })
    vim.keymap.set('n', 'k', 'gk', { buffer = true, silent = true })
