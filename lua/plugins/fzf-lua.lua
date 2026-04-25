return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("fzf-lua").setup({})
    local fzf = require("fzf-lua")
    local wt = require("git-worktree")
    function git_worktrees()
      fzf.fzf_exec("git worktree list", {
        prompt = "Worktrees> ",
        actions = {
          ["default"] = function(selected)
            local path = selected[1]:match("^(%S+)")
            if path then
              wt.switch_worktree(path)
            end
          end,
        },
      })
    end
  end
}
