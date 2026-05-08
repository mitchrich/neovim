vim.diagnostic.config({ virtual_text = { current_line = true } })

vim.lsp.config('clangd', {
    cmd = {
        'clangd',
        '--clang-tidy',
        '--compile-commands-dir=.',
    }, -- Use CLANGD_FLAGS in per directory environment to set query driver
})

vim.lsp.config('lua_ls', {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if
                path ~= vim.fn.stdpath('config')
                and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
            then
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            runtime = {
                version = 'LuaJIT',
                -- Tell the language server how to find Lua modules same way as Neovim
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            -- Make the server aware of Neovim runtime files
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    "${3rd}/luv/library"
                }
            }
        })
    end,
    settings = {
        Lua = {}
    }
})

vim.lsp.config('ruff', {
    init_options = {
        settings = {
            lint = {
                enable = true,
            }
        }
    }
})

vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {
            check = {
                command = "clippy"
            }
        }
    }
})

vim.lsp.config('nixd', {
    settings = {
        nixd = {
            formatting = {
                command = { "nixfmt" },
            },
        },
    },
})

vim.lsp.enable({ 'rust_analyzer', 'clangd', 'ruff', 'lua_ls', 'nixd' })
