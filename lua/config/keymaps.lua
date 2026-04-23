vim.keymap.set({"i","n","v"},"<C-s>", "<Esc>:w<Cr>")

vim.keymap.set({"i","n","v"},"<C-f>", function()
  require("fzf-lua").files({cwd = vim.fn.getcwd()})
end)
vim.keymap.set({"i","n","v"},"<C-g>", function()
  require("fzf-lua").live_grep({cwd = vim.fn.getcwd()})
end)

vim.keymap.set("n","<leader>de", ':%s/\n\\{2,}/\r/')
vim.keymap.set("n","-","<CMD>Oil<CR>")

-- keymap for git diff toggle by mini.diff
vim.keymap.set("n","<leader>gd",':lua MiniDiff.toggle_overlay()<CR>')

vim.keymap.set("t","<C-w>h","<C-\\><C-n><C-w>h")
vim.keymap.set("t","<C-w>l","<C-\\><C-n><C-w>l")

local harpoon = require("harpoon")
vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
