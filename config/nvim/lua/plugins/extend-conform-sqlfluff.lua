return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = function(_, opts)
      opts.log_level = vim.log.levels.DEBUG
      opts.formatters.sqlfluff = {
        args = { "format", "--dialect=postgres", "-" },
      }
      opts.formatters.csharpier = {
        command = "csharpier",
        args = { "--write-stdout" },
      }
    end,
  },
}
