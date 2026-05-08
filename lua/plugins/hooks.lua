--Update Treesitter Configs After Update
vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'telescope-fzf-native.nvim' and (kind == 'update' or kind == 'install') then
            vim.fn.system({ 'make', '-C', ev.data.path })
        end
    end
})
