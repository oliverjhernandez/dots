return {
  {
    "mistweaverco/kulala.nvim",
    config = function()
      -- Setup is required, even if you don't pass any options
      require("kulala").setup({
        ui = {
          default_view = "headers_body",
        },
      })
    end,
  },
}
