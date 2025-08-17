-- stylua: ignore
if true then return {} end

return {
  { "nvim-neotest/neotest-plenary" },
  {
    "nvim-neotest/neotest",
    opts = { adapters = { "neotest-plenary" } },
  },
}
