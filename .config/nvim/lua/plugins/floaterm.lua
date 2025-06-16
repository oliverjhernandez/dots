return {
  "nvzone/floaterm",
  dependencies = "nvzone/volt",
  opts = {
    border = false,
    size = { h = 80, w = 70 },

    -- to use, make this func(buf)
    mappings = { sidebar = nil, term = nil },

    -- Default sets of terminals you'd like to open
  },
  cmd = "FloatermToggle",
  keys = {
    {
      "<leader>tt",
      "<cmd>FloatermToggle<CR>",
      desc = "FloatTerm Toggle",
    },
  },
}
