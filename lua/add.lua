vim.pack.add({
    'https://github.com/nvim-mini/mini.nvim',
    'https://github.com/stevearc/oil.nvim',

    -- LSP
    'https://github.com/neovim/nvim-lspconfig',
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
    'https://github.com/chomosuke/typst-preview.nvim',

    -- Theme
    'https://github.com/rebelot/kanagawa.nvim',
})

vim.cmd('packadd nohlsearch')
vim.cmd('packadd nvim.undotree')
