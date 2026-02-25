return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      columns = {
        "icon",
      },
      view_options = {
        show_hidden = true,
      },
      float = {
        padding = 2,
        max_width = 90,
        max_height = 40,
        border = "rounded",
        win_options = {
          winblend = 0,
        },
      },
      keymaps = {
        ["q"] = { "actions.close", mode = "n" },
        ["<C-s>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-v>"] = { "actions.select", opts = { vertical = true } },
	['yp'] = {
          desc = 'Copy filepath to system clipboard',
          callback = function ()
            require('oil.actions').copy_entry_path.callback()
            vim.fn.setreg("+", vim.fn.getreg(vim.v.register))
          end,
        },
      },
    },
    keys = {
      {
        "<leader>e",
        function()
          require("oil").open_float() -- Changed to open_float
        end,
        desc = "Explorer (oil float)",
      },
      {
        "<leader>E",
        function()
          require("oil").open_float(vim.fn.getcwd())
        end,
        desc = "Explorer (cwd float)",
      },
    },
  },
}
