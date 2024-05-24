return {

  -- Terraform
  "hashicorp/terraform-ls",
  "hashivim/vim-terraform",

  -- colorschemes
  { "rebelot/kanagawa.nvim" },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "Verf/deepwhite.nvim", priority = 1000 },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("cyberdream").setup({
        transparent = false,
        italic_comments = true,
        hide_fillchars = true,
        borderless_telescope = true,
        terminal_colors = false,
        theme = {
          variant = "light",
        },
      })
    end,
  },

  "taybart/b64.nvim",
  "L3MON4D3/LuaSnip",

  "rcarriga/nvim-notify",
}
