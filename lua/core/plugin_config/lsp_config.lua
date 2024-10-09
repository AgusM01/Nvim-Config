require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "hls",
        "elp",
        "pylsp"
    }
})

local on_attach = function(_, _)

    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>co', vim.lsp.buf.code_action, {})
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    local lspconfig = require("lspconfig")

    lspconfig.tsserver.setup({
        capabilities = capabilities
    })
    
    lspconfig.html.setup({
        capabilities = capabilities
    })
    
    lspconfig.lua_ls.setup({
        capabilities = capabilities
    })

end

require("lspconfig").lua_ls.setup {
    on_attach = on_attach
}

require("lspconfig").bashls.setup {
    on_attach = on_attach
}

require("lspconfig").clangd.setup {
    on_attach = on_attach
}

require("lspconfig").hls.setup {
    on_attach = on_attach
}

require("lspconfig").elp.setup {
    on_attach = on_attach
}

require("lspconfig").pyright.setup {
    on_attach = on_attach
}
