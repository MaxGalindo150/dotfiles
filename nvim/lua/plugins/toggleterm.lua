return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { "<C-\\>", desc = "Toggle terminal" },
    { "<leader>tv", desc = "Terminal vertical" },
    { "<leader>th", desc = "Terminal horizontal" },
    { "<leader>tf", desc = "Terminal flotante" },
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    open_mapping = [[<C-\>]],
    direction = "vertical",
    shade_terminals = true,
    shading_factor = 2,
    start_in_insert = true,
    persist_size = true,
    close_on_exit = true,
  },
  config = function(_, opts)
    require("toggleterm").setup(opts)

    vim.keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Terminal vertical" })
    vim.keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Terminal horizontal" })
    vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Terminal flotante" })

    -- Salir de insert mode en la terminal sin cerrarla
    function _G.set_terminal_keymaps()
      local opts_buf = { buffer = 0 }
      vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts_buf)
      vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts_buf)
      vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts_buf)
      vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts_buf)
      vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts_buf)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
  end,
}
