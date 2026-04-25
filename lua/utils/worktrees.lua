-- lua/utils/worktrees.lua
local M = {}

function M.git_worktrees()
  local fzf = require("fzf-lua")
  local wt = require("git-worktree")

  fzf.fzf_exec("git worktree list", {
    prompt = "Worktrees> ",
    actions = {
      ["default"] = function(selected)
        local path = selected[1]:match("^(%S+)")
        if path then wt.switch_worktree(path) end
      end,
    },
  })
end

return M  -- ← this is what makes require() work
