return {
  "everviolet/nvim",
  name = "evergarden",
  priority = 2000, -- Colorscheme plugin is loaded first before any other plugins
  opts = {
    theme = {
      variant = "fall", -- 'winter'|'fall'|'spring'|'summer'
      accent = "dark",
    },
    editor = {
      transparent_background = true,
      sign = { color = "none" },
      float = {
        color = "mantle",
        solid_border = false,
      },
      completion = {
        color = "surface0",
      },
    },
    integrations = {
      cmp = true,
      blink_cmp = true,
      telescope = true,
    },
  },
}
