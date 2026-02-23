return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { 'datsfilipe/min-theme.nvim' },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "min-theme",
    },
  },
}
