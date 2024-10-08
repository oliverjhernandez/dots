local opts = function(_, opts)
  local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  local luasnip = require("luasnip")
  local cmp = require("cmp")

  local kind_icons = {
    Text = "",
    Method = "󰆧",
    Function = "⨐",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
  }

  opts.preselect = cmp.PreselectMode.None

  opts.snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["luasnip"](args.body) -- For `vsnip` users.
      require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
    end,
  }

  opts.window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  }

  opts.view = {
    entries = { name = "custom", selection_order = "near_cursor" },
  }

  opts.sources = {
    { name = "nvim_lsp" },
    { name = "html-css" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "path" },
    { name = "emoji" },
  }

  opts.performance = {
    max_view_entries = 7,
  }

  opts.formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end,
  }

  opts.mapping = vim.tbl_extend("force", opts.mapping, {
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
        -- this way you will only jump inside the snippet region
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  })
end

return {
  {
    "nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function(_, opts)
      require("cmp").setup()
    end,
  },

  {
    "hrsh7th/cmp-nvim-lua",
    config = function()
      require("cmp").setup()
    end,
  },

  {
    "hrsh7th/cmp-cmdline",
    config = function()
      require("cmp").setup()
    end,
  },
  {
    "hrsh7th/cmp-nvim-lsp-document-symbol",
    config = function()
      require("cmp").setup()
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    opts = opts,
  },
}
