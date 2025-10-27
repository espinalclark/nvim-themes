return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {
    style = "night", 
    transparent = true,
    terminal_colors = true, 
    styles = {
      comments = { italic = true },
      keywords = { bold = true },
      functions = { bold = true },
      variables = {},
    },
    on_highlights = function(hl, c)
      -- Hereda colores del terminal, no fija hexadecimales
      hl.Normal       = { fg = c.fg, bg = "none" }
      hl.NormalNC     = { fg = c.fg, bg = "none" }
      hl.NormalFloat  = { bg = "none" }
      hl.SignColumn   = { bg = "none" }
      hl.LineNr       = { bg = "none" }
      hl.CursorLine   = { bg = "none" }
      hl.StatusLine   = { fg = c.fg, bg = "none" }
      hl.StatusLineNC = { fg = c.fg_dark, bg = "none" }
      hl.Pmenu        = { bg = "none", fg = c.fg }
      hl.PmenuSel     = { bg = "none", fg = c.fg_bright }
      hl.WinSeparator = { fg = c.border, bg = "none" }
      hl.Visual       = { bg = c.bg_highlight }
    end,
  },
  config = function(_, opts)
    require("tokyonight").setup(opts)
    vim.cmd([[colorscheme tokyonight]])

    -- Forzar fondo transparente por si algún plugin intenta colorearlo
    vim.cmd([[
      highlight Normal guibg=none
      highlight NonText guibg=none
      highlight NormalNC guibg=none
      highlight SignColumn guibg=none
      highlight LineNr guibg=none
      highlight Folded guibg=none
    ]])
  end,
}

