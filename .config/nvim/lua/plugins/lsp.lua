return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = true },
      ---@type lspconfig.options
      servers = {
        html = {},
        yamlls = {
          debug = false, -- enable debug logging for commands
          go_to_source_definition = {
            fallback = true, -- fall back to standard LSP definition on failure
          },
          server = { -- pass options to lspconfig's setup method
            on_attach = function(client, bufnr)
              require("lsp_signature").on_attach(signature_setup, bufnr)
              -- require("vim.lsp").common_on_attach()
            end,
            settings = {
              yaml = {
                schemas = {
                  ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                  ["https://raw.githubusercontent.com/microsoft/azure-pipelines-vscode/master/service-schema.json"] = "azure-pipelines.yml",
                  ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                  ["http://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                  ["http://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                  ["http://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                  ["http://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                  ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                  ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*gitlab-ci*.{yml,yaml}",
                  ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] = "*api*.{yml,yaml}",
                  ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "*docker-compose*.{yml,yaml}",
                  ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] = "*flow*.{yml,yaml}",
                  ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                  kubernetes = "*.{yml,yaml}",
                },
                keyOrdering = true,
                format = {
                  enable = true,
                  singleQuote = false,
                },
              },
            },
          },
        },
      },
    },
  },
}
