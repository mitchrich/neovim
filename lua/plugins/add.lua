vim.pack.add({
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/sschleemilch/slimline.nvim',
    'https://github.com/nvim-mini/mini.nvim',
    'https://github.com/rebelot/kanagawa.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/nvim-telescope/telescope-fzf-native.nvim',
    'https://github.com/nvim-lua/plenary.nvim', -- Telescope dependency
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/danymat/neogen",
    { src = "https://github.com/saghen/blink.cmp", version = vim.version.range("1.*") },
})

vim.cmd('packadd nohlsearch')
vim.cmd('packadd nvim.undotree')
