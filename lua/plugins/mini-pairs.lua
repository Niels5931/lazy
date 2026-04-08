return {
  "nvim-mini/mini.pairs",
  version = false,
  config = function()
    -- Custom config for Verilog-friendly pairing (1'b0 etc)
    require("mini.pairs").setup({
      mappings = {
        ["'"] = {
          action = "closeopen",
          pair = "''",
          neigh_pattern = "[^%w\\][^%w]",
          register = { cr = false },
        },
        ['"'] = { action = "closeopen", pair = '""', neigh_pattern = "[^%w\\]." },
        ['('] = { action = "open", pair = '()', neigh_pattern = "[^\\][^%w]" },
        ['{'] = { action = "open", pair = '{}', neigh_pattern = ".[^%w]" },
        ['['] = { action = "open", pair = '[]', neigh_pattern = ".[^%w]" },
      },
    })
  end,
}
