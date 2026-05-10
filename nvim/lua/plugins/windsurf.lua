return {
  "Exafunction/windsurf.vim",
  event = "BufEnter",
  config = function()
    vim.keymap.set("n", "<leader>ai", function()
      vim.cmd("CodeiumToggle")
      local enabled = vim.g.codeium_enabled
      vim.notify("Codeium " .. (enabled and "enabled" or "disabled"), vim.log.levels.INFO)
    end, { desc = "Toggle Codeium (AI completion)" })
  end,
}
