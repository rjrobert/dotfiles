return {
  -- {
  --   dir = (vim.env.GHOSTTY_RESOURCES_DIR or "") .. "/../vim/vimfiles",
  --   lazy = false,
  --   name = "ghostty",
  --   cond = vim.env.GHOSTTY_RESOURCES_DIR ~= nil,
  -- },
  {
    "isak102/ghostty.nvim",
    config = function()
      require("ghostty").setup()
    end,
  },
}
