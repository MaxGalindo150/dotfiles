return {
  "3rd/image.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    backend = "kitty",
    integrations = {
      markdown = {
        enabled = true,
        download_remote_images = true,
        clear_in_insert_mode = false,
      },
    },
    max_width = 100,
    max_height = 40,
    max_height_window_percentage = math.huge,
    max_width_window_percentage = math.huge,
    window_overlap_clear_enabled = true,
  },
}
