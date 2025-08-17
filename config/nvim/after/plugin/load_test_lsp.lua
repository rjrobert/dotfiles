vim.api.nvim_create_autocmd("FileType", {
  pattern = "markdown",
  callback = function()
    local client = vim.lsp.start({
      name = "educationalsp",
      cmd = { "/Users/robertball/Developer/educationalsp/educationalsp" },
      on_attach = LazyVim.lsp.on_attach,
    })

    if not client then
      vim.notify("Failed to start LSP client")
      return
    end

    vim.notify("LSP client started for markdown files")
    vim.lsp.buf_attach_client(0, client)
  end,
})
