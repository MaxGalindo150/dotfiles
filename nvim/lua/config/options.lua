-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
vim.opt.wrap = true

-- Transparent background
local function set_transparent()
  local groups = {
    "Normal", "NormalNC", "NormalFloat", "FloatBorder",
    "SignColumn", "StatusLine", "StatusLineNC",
    "TabLine", "TabLineFill", "TabLineSel",
    "WinBar", "WinBarNC",
    "NeoTreeNormal", "NeoTreeNormalNC", "NeoTreeEndOfBuffer",
    "NeoTreeWinSeparator", "NeoTreeStatusLine", "NeoTreeStatusLineNC",
    "lualine_c_normal", "lualine_x_normal",
  }
  for _, group in ipairs(groups) do
    vim.api.nvim_set_hl(0, group, { bg = "none", ctermbg = "none" })
  end
end

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = set_transparent,
})

vim.api.nvim_create_autocmd("VimEnter", {
  callback = set_transparent,
})
vim.g.codeium_os = "Darwin"
vim.g.codeium_arch = "arm64"
