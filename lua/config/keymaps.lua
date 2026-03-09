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
