-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("telescope").load_extension("noice")
-- BufferLine Config
require("bufferline").setup({})

-- Carbon Fox Config
require("nightfox").setup({
  options = {
    transparent = true, -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    styles = { -- Style to be applied to different syntax groups
      comments = "NONE", -- Value is any valid attr-list value `:help attr-list`
      conditionals = "italic",
      constants = "NONE",
      functions = "italic,altfont",
      keywords = "italic",
      numbers = "NONE",
      operators = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    modules = { -- List of various plugins and additional options
    },
  },
  palettes = {},
  specs = {},
  groups = {},
})

-- setup must be called before loading
vim.cmd("colorscheme nightfox")

-- Old Catppuccin colorscheme settings

-- require("catppuccin").setup({
--
--   flavour = "mocha", -- latte, frappe, macchiato, mocha
--   background = { -- :h background
--     light = "latte",
--     dark = "mocha",
--   },
--   transparent_background = false, -- disables setting the background color.
--   float = {
--     transparent = false, -- enable transparent floating windows
--     solid = false, -- use solid styling for floating windows, see |winborder|
--   },
--   show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
--   term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
--   dim_inactive = {
--     enabled = false, -- dims the background color of inactive window
--     shade = "dark",
--     percentage = 0.15, -- percentage of the shade to apply to the inactive window
--   },
--   no_italic = false, -- Force no italic
--   no_bold = false, -- Force no bold
--   no_underline = false, -- Force no underline
--   styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
--     comments = { "italic" }, -- Change the style of comments
--     conditionals = { "italic" },
--     loops = { "italic" },
--     functions = { "italic", "bold" },
--     keywords = { "italic" },
--     strings = {},
--     variables = {},
--     numbers = {},
--     booleans = {},
--     properties = {},
--     types = {},
--     operators = {},
--     -- miscs = {}, -- Uncomment to turn off hard-coded styles
--   },
--   lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
--     virtual_text = {
--       errors = { "italic" },
--       hints = { "italic" },
--       warnings = { "italic" },
--       information = { "italic" },
--       ok = { "italic" },
--     },
--     underlines = {
--       errors = { "underline" },
--       hints = { "underline" },
--       warnings = { "underline" },
--       information = { "underline" },
--       ok = { "underline" },
--     },
--     inlay_hints = {
--       background = true,
--     },
--   },
--   color_overrides = {},
--   custom_highlights = {},
--   default_integrations = true,
--   auto_integrations = true,
--   integrations = {
--     cmp = true,
--     gitsigns = true,
--     nvimtree = true,
--     notify = false,
--     mini = {
--       enabled = true,
--       indentscope_color = "",
--     },
--     -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
--   },
-- })

-- Lua Line Config Start

require("lualine").setup({
  options = {
    theme = "auto",
    component_separators = "",
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
    lualine_b = { "filename", "branch" },
    lualine_c = {
      "%=",
    },
    lualine_x = {},
    lualine_y = { "diff", "diagnostics", "filetype", "progress" },
    lualine_z = {
      { "location", separator = { right = "" }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { "filename" },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { "location" },
  },
  tabline = {},
  extensions = {},
})

-- Lua Line Config End

vim.cmd.colorscheme("carbonfox")
vim.opt.winborder = "rounded"
