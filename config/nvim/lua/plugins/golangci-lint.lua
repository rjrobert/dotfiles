return {
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts.servers.gopls.settings.gopls.staticcheck = false
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "golangci-lint-langserver",
      },
    },
  },
}
