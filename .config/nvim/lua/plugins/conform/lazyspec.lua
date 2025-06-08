return {

  -- formatter
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        templ = { "templ" },
        go = { "goimports", "gofmt" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        vue = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        yaml = { "prettier" },
        astro = { "prettier" },
        markdown = { "prettier" },
        "markdown.mdx" == { "prettier" },
        graphql = { "prettier" },
        handlebars = { "prettier" },
        java = { "google-java-format" },
      },
    },
  },
}
