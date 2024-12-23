require("neo-tree").setup({
  event_handlers = {
    {
      event = "file_open_requested",
      handler = function ()
        vim.cmd('Neotree close')
      end
    }
  },
  window = {
    width = 26,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<space>"] = {
        "open",
         nowait = false,
      },
    }
  },

  vim.keymap.set('n', '<F3>', function()
    local neotree_open = false

    for _, win in ipairs(vim.api.nvim_list_wins()) do
      if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == 'neo-tree' then
        neotree_open = true
        break
      end
    end

    -- reveals and focusses current file
    if neotree_open then
      vim.cmd('Neotree close')
    else
      vim.cmd('Neotree filesystem reveal')
    end
  end, { desc = "Toggle Neotree or reveal the filesystem" })
})

-- cycle buffers
-- vim.keymap.set('n', '<F20>', '<cmd>BufferLineCycleNext<cr>', { desc = "Cycle to next buffer" })

-- close current buffer
-- vim.keymap.set('n', '<F21>', '<cmd>bd<cr>', { desc = "Close current buffer" })
