return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup{
      options = {
        mode                 = 'buffers',
        diagnostics          = 'nvim_lsp',
        always_show_bufferline = true,
      },
    }

    for i = 1, 9 do
      vim.keymap.set(
        'n',
        ('<leader>%d'):format(i),
        ('<Cmd>BufferLineGoToBuffer %d<CR>'):format(i),
        { desc = ('Ir para a aba %d'):format(i) }
      )
    end

    vim.keymap.set(
      'n',
      '<leader>0',
      '<Cmd>BufferLineGoToBuffer -1<CR>',
      { desc = 'Ir para a última aba' }
    )

    vim.keymap.set('n', '<Tab>',   '<Cmd>BufferLineCycleNext<CR>', { desc = 'Próxima aba' })
    vim.keymap.set('n', '<S-Tab>', '<Cmd>BufferLineCyclePrev<CR>', { desc = 'Aba anterior' })
  end,
}

