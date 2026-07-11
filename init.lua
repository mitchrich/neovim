vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Create Hooks for Building Plugins
require("plugins.hooks")
require("plugins.add")
require("plugins.ide")
require("plugins.ui")
require("plugins.edit")

require("config.langserver")

-- Editor settings
vim.opt.signcolumn = "yes"
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.undofile = true
vim.g.have_nerd_font = true
vim.opt.scrolloff = 8
vim.o.wrap = false
vim.o.winborder = "rounded"

-- Misc settings
MiniIcons.mock_nvim_web_devicons()
vim.cmd("colorscheme kanagawa-dragon")

-- General Keybinds
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<leader>y', "\"+y", { desc = 'Copy to system board' })
vim.keymap.set('v', '<leader>y', "\"+y", { desc = 'Copy to system board' })
vim.keymap.set('n', '<leader>k', ':nohlsearch<CR>', { desc = 'Clear search' })
vim.keymap.set('n', '<leader>e', MiniFiles.open, { desc = 'File Explorer' })

-- LSP Keybinds
vim.keymap.set('n', '<leader>m', vim.lsp.buf.format, { desc = 'Format buffer' })
vim.keymap.set('n', '<leader>d', ':Neogen<CR>', { desc = 'Generate Docs' })
vim.keymap.set('n', 'gp', vim.diagnostic.setloclist, { desc = 'Show LSP Problems' })
vim.keymap.set('n', '<leader>i', function()
    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    vim.notify(vim.lsp.inlay_hint.is_enabled() and "Inlay Hints Enabled" or "Inlay Hints Disabled")
end, { desc = 'Toggle Inlay Hints' })

-- Telescope Config
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fr', builtin.live_grep, { desc = 'Telescope ripgrep' })
vim.keymap.set('n', '<leader>fm', builtin.man_pages, { desc = 'Telescope manpages' })
vim.keymap.set('n', '<leader>fs', builtin.lsp_dynamic_workspace_symbols, { desc = 'Telescope symbols' })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function()
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
    end,
})

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
        if client.name == "clangd" then
            vim.keymap.set('n', '<leader>h', ':LspClangdSwitchSourceHeader<CR>', { desc = 'Switch Header<->Source' })
        end
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "nix",
    callback = function()
        vim.opt_local.shiftwidth = 2
        vim.opt_local.tabstop = 2
        vim.opt_local.softtabstop = 2
    end,
})

vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({ higroup = "Visual", timeout = 150 })
    end,
})
