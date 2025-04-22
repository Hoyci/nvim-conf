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
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("lazy").setup("plugins")
vim.keymap.set("v", "<C-c>", '"+y', { desc = "Copiar para o clipboard" })
vim.keymap.set("n", "<C-v>", '"+p', { desc = "Colar do clipboard" })
vim.keymap.set("n", "<C-z>", "u", { desc = "Desfazer (undo)" })
vim.keymap.set("n", "<C-y>", "<C-r>", { desc = "Refazer (redo)" })
vim.keymap.set("n", "<leader>tt", ":vert botright terminal<CR>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("Neotree show left")
  end,
})
