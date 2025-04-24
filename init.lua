local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.env.PATH = vim.env.PATH .. ':/usr/local/go/bin:/usr/bin:/bin:/usr/local/bin:' .. os.getenv("HOME") .. "/go/bin"
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copiar para o clipboard" })
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Colar do clipboard" })
vim.keymap.set("n", "<C-z>", "u", { desc = "Desfazer (undo)" })
vim.keymap.set("n", "<C-y>", "<C-r>", { desc = "Refazer (redo)" })
vim.keymap.set("n", "<leader>tt", ":vert botright terminal<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-f>", "/")
vim.keymap.set("n", "<CS-f>", ":vimgrep /")
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { noremap = true, silent = true })
local function goto_definition_in_new_tab()
  vim.cmd('tabnew')
  vim.lsp.buf.definition()
end

vim.keymap.set('n', '<leader>gd', goto_definition_in_new_tab, { noremap = true, silent = true, desc = "Go to Definition in new tab" })

vim.keymap.set("n", "<leader>q", ":bd<CR>", { desc = "Close current file (buffer)" })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("Neotree show left")
  end,
})
