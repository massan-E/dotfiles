return {
  -- kickstartのデフォルトテーマ(tokyonight)を無効化
  {
    'folke/tokyonight.nvim',
    enabled = false,
  },
  -- darcula
  {
    'Carcuis/darcula.nvim',
    priority = 1000,
    init = function()
      vim.g.darcula_transparent = true
      vim.cmd.colorscheme 'darcula'
      vim.cmd [[
        highlight Visual guibg=#264E77 ctermbg=24
        highlight Search guibg=#264E77 ctermbg=24
        highlight PmenuSel guibg=#264E77 ctermbg=24
        highlight TelescopeSelection guibg=#264E77 ctermbg=24
      ]]
    end,
  },

  -- hlchunk
  {
    'shellRaining/hlchunk.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('hlchunk').setup {
        chunk = { enable = true },
        indent = { enable = true },
        line_num = { enable = false },
      }
    end,
  },

  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    version = '*',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('nvim-tree').setup {}
    end,
  },

  -- neoscroll
  { 'karb94/neoscroll.nvim', opts = {} },

  -- gitlinker
  {
    'ruifm/gitlinker.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {},
    keys = {
      { '<leader>gy', function() require('gitlinker').get_buf_range_url('n') end, desc = 'Git link to clipboard' },
    },
  },

  -- markdown-preview
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && npm install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
    keys = {
      { '<leader>mp', '<cmd>MarkdownPreviewToggle<cr>', desc = 'Markdown Preview' },
      { '<leader>ms', '<cmd>MarkdownPreviewStop<cr>', desc = 'Stop Preview' },
    },
  },

  -- diffview.nvim
  {
    'sindrets/diffview.nvim',
    keys = {
      { '<leader>hd', '<cmd>DiffviewOpen HEAD~1<CR>' },
      { '<leader>hf', '<cmd>DiffviewFileHistory %<CR>' },
    },
  },

  -- 透過設定など
  {
    'lazy.nvim', -- 設定を読み込むためのダミー

    -- config ではなく init を使い、autocmd を登録する
    init = function()
      -- VimEnter (すべての起動が完了した後) にハイライトを実行
      vim.api.nvim_create_autocmd('VimEnter', {
        pattern = '*',
        once = true, -- 起動時に一度だけ実行
        callback = function()
          vim.cmd [[
            " --- 基本ウィンドウ ---
            highlight Normal guibg=none
            highlight Normal ctermbg=none
            highlight NonText guibg=none
            highlight NonText ctermbg=none
            highlight NormalNC guibg=none
            highlight NormalSB guibg=none

            " --- 行番号・サイン列 (追加) ---
            highlight LineNr guibg=none
            highlight LineNr ctermbg=none
            highlight SignColumn guibg=none
            highlight SignColumn ctermbg=none

            " --- フローティングウィンドウ (Telescopeなど) (追加) ---
            highlight NormalFloat guibg=none
            highlight NormalFloat ctermbg=none
          ]]
        end,
      })
    end,
  },
  -- Yank git-relative path
  vim.keymap.set('n', '<leader>yg', function()
    local path = vim.fn.expand '%:.'
    vim.fn.setreg('+', path)
    print('Copied git path: ' .. path)
  end, { desc = 'Yank git path' }),

  -- Yank full path
  vim.keymap.set('n', '<leader>yf', function()
    local path = vim.fn.expand '%:p'
    vim.fn.setreg('+', path)
    print('Copied full path: ' .. path)
  end, { desc = 'Yank full path' }),

  -- <number><CR> で絶対行にジャンプ
  vim.keymap.set('n', '<CR>', function()
    local count = vim.v.count
    if count > 0 then
      vim.cmd('normal! ' .. count .. 'G')
    else
      vim.cmd 'normal! \r'
    end
  end, { desc = 'Jump to absolute line with count' }),

  -- jj ESC
  vim.keymap.set('i', 'jj', '<Esc>', { noremap = true, silent = true }),
}
