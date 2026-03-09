return {
  "saghen/blink.cmp",
  version = "*",
  config = function()
    require("blink.cmp").setup({
      keymap = { preset = "enter" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
      fuzzy = { implementation = "lua" },
    })
  end,
}
