return {
  'nvim-treesitter/nvim-treesitter',
  branch = "master",
  lazy = false,
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  main = 'nvim-treesitter.config',
  config = function()
    -- Auto-enable treesitter highlighting for buffers with a parser
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })
  end,
}
