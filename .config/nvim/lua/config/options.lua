-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
local o              = vim.o

vim.g.mapleader      = " "

o.laststatus         = 3 --Global statusline
o.showmode           = false
o.clipboard          = "unnamedplus"
o.relativenumber     = false

--Indenting
o.expandtab          = true
o.shiftwidth         = 2
o.smartindent        = true
o.tabstop            = 2
o.softtabstop        = 2
o.ignorecase         = true
o.smartcase          = true
o.mouse              = "a"

o.signcolumn         = "yes"
o.splitbelow         = true
o.splitright         = true
o.termguicolors      = true
o.timeoutlen         = 400
o.cursorline         = true

vim.opt.fillchars    = { eob = " " }

vim.g.snacks_animate = false
--vim.g.autoformat = false

return {
  "snacks.nvim:",
  opts = {
    scroll = { enabled = false }
  }
}
