return {
  {
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")

      nvim_tmux_nav.setup({
        disable_when_zoomed = true,
      })
    end,
    keys = {
      { "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>", desc = "Tmux navigate left" },
      { "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>", desc = "Tmux navigate down" },
      { "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>", desc = "Tmux navigate up" },
      { "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>", desc = "Tmux navigate right" },
      { "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<CR>", desc = "Tmux navigate last active" },
      { "<C-Space>", "<cmd>NvimTmuxNavigateNext<CR>", desc = "Tmux navigate next" },
    },
  },
}
