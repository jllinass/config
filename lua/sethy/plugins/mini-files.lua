-- lua/sethy/plugins/mini-files.lua

return {
  'echasnovski/mini.files',
  version = false,
  config = function()
    local mini_files = require('mini.files')

    -- 1. Inicialización y configuración principal
    mini_files.setup({
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 40,
      },
      mappings = {
        close       = 'q',
        go_in       = 'l',
        go_in_plus  = '<CR>',
        go_out      = 'h',
        go_out_plus = 'H',
        reset       = '<BS>',
        synchronize = '=',
        trim_show   = '.',
      },
    })

    -- 2. Marcadores / Bookmarks útiles
    local add_marks = function()
      local mf = require('mini.files')
      mf.set_bookmark('c', vim.fn.stdpath('config'), { desc = 'Configuración Nvim' })
      mf.set_bookmark('w', vim.fn.getcwd, { desc = 'Directorio actual' })
      mf.set_bookmark('h', vim.fn.expand('~'), { desc = 'Directorio Home' })
    end

    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesExplorerOpen',
      callback = add_marks,
      desc = 'Añadir marcadores a mini.files',
    })

    -- 3. Atajos globales (Keymaps)
    local map = vim.keymap.set

    map('n', '<leader>ed', function()
      require('mini.files').open(vim.fn.getcwd())
    end, { desc = 'Abrir mini.files (Directorio actual)' })

    map('n', '<leader>ep', function()
      require('mini.files').open(vim.api.nvim_buf_get_name(0), true)
    end, { desc = 'Abrir mini.files (Directorio del archivo actual)' })

    map('n', '<leader>e', function()
      local mf = require('mini.files')
      if not mf.close() then
        mf.open(vim.api.nvim_buf_get_name(0), true)
      end
    end, { desc = 'Alternar mini.files' })
  end,
}
