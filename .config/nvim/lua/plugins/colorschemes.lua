return {
  { "folke/tokyonight.nvim", lazy = false, priority = 1000, opts = {} },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_enable_italic = true
      vim.cmd.colorscheme("gruvbox-material")
    end,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      vim.cmd("colorscheme rose-pine")
    end,
  },
}
