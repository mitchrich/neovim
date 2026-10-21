-- Editor settings
vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.undofile = true
vim.opt.splitright = true
vim.opt.signcolumn = "yes"
vim.opt.scrolloff = 8
vim.opt.wrap = false
vim.opt.winborder = "rounded"
vim.opt.exrc = true;

vim.g.have_nerd_font = true

require("add")
require("plug-setup")
require("mini")
require("lsp")
require("theme")

-- General Keybinds
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set({'n', 'v'}, 'gy', "\"+y", { desc = 'Copy to system board' })
vim.keymap.set('n', '<leader>k', '<CMD>nohlsearch<CR>', { desc = 'Clear search' })
vim.keymap.set('n', '<leader>c', "<CMD>bd<CR>", { desc = 'Close Buffer' } )

-- Split movement
vim.keymap.set('n', '<C-h>', '<CMD>wincmd h<CR>')
vim.keymap.set('n', '<C-j>', '<CMD>wincmd j<CR>')
vim.keymap.set('n', '<C-k>', '<CMD>wincmd k<CR>')
vim.keymap.set('n', '<C-l>', '<CMD>wincmd l<CR>')

-- LSP Keybinds
vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.keymap.set('n', 'gp', vim.diagnostic.setloclist, { desc = 'Show LSP Problems' })
        vim.keymap.set('n', 'grf', vim.lsp.buf.format, { desc = 'Format buffer' })
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
        vim.keymap.set('n', '<leader>i', function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
            vim.notify(vim.lsp.inlay_hint.is_enabled() and "Inlay Hints Enabled" or "Inlay Hints Disabled")
        end, { desc = 'Toggle Inlay Hints' })
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client.name == "clangd" then
            vim.keymap.set(
                'n', '<localleader>h', '<CMD>LspClangdSwitchSourceHeader<CR>', { desc = 'Switch Header<->Source', buf=0})
        elseif client.name == "texlab" then
            vim.keymap.set('n', '<localleader>v', '<CMD>LspTexlabForward<CR>', { desc = 'Forward Texsync', buf=0})
        elseif client.name == "tinymist" then
            vim.keymap.set(
                'n',
                '<localleader>p', 
                '<CMD>TypstPreview<CR>',
                { desc = 'Start preview', buf=0}
            )
            vim.keymap.set('n', '<localleader>s', '<CMD>TypstPreviewSyncCursor<CR>', { desc = 'Sync cursor', buf=0})
        end
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
    end,
})

