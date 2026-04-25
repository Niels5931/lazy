local harpoon = require("harpoon")
local fzf     = require("fzf-lua")
vim.keymap.set({"i","n","v"},"<C-s>", "<Esc>:w<Cr>")

vim.keymap.set({"i","n","v"},"<C-f>", function()
  fzf.files({cwd = vim.fn.getcwd()})
end)
vim.keymap.set({"i","n","v"},"<C-g>", function()
  fzf.live_grep({cwd = vim.fn.getcwd()})
end)
vim.keymap.set({"i","n","v"},"<C-b>", function()
  fzf.buffers({cwd = vim.fn.getcwd()})
end)
vim.keymap.set("n", "<leader>h", function()
  local marks = harpoon:list().items
  local items = {}
  for i, mark in ipairs(marks) do
    table.insert(items, i .. ": " .. mark.value)
  end
  fzf.fzf_exec(items, {
    prompt = "Harpoon❯ ",
    actions = {
      ["default"] = function(selected)
        local idx = tonumber(selected[1]:match("^(%d+):"))
        if idx then harpoon:list():select(idx) end
      end,
    },
  })

end, { desc = "Harpoon Picker (fzf-lua)" })

vim.keymap.set("n","<leader>de", ':%s/\n\\{2,}/\r/')
vim.keymap.set("n","-","<CMD>Oil<CR>")

-- keymap for git diff toggle by mini.diff
vim.keymap.set("n","<leader>gd",':lua MiniDiff.toggle_overlay()<CR>')

vim.keymap.set("t","<C-w>h","<C-\\><C-n><C-w>h")
vim.keymap.set("t","<C-w>l","<C-\\><C-n><C-w>l")

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

vim.keymap.set("n", "<leader>q", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<leader>w", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<leader>e", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<leader>r", function() harpoon:list():select(4) end)

vim.keymap.set("n", "<leader>gw", function()
  require("utils.worktrees").git_worktrees()
end, { desc = "Git Worktrees" })
