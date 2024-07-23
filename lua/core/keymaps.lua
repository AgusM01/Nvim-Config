vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true

-- use spaces for tabs and whatnot
vim.opt.tabstop = 2
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true

vim.keymap.set('n', '<C-h>', ':nohlsearch<CR>')

local function toggle_terminal()
    -- Obtener el modo actual
    local mode = vim.fn.mode()

    if mode == 'n' then
        -- Si estamos en modo normal, abrir una nueva terminal
        vim.cmd('vsplit')
        vim.cmd('terminal')
    elseif mode == 't' then
        -- Si estamos en modo terminal, salir al modo normal
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-\\><C-n>', true, false, true), 'n', true)
    end
end

vim.keymap.set({'n','t'}, '<C-s>', toggle_terminal)

