vim.g.mapleader = " "
vim.g.lazyvim_picker = "snacks"

local opt = vim.opt

opt.guicursor = {
  "n-v:block-Cursor/lCursor",
  "i-c-ci-ve:block-TermCursor",
}

opt.relativenumber = false
opt.textwidth = 240
opt.mouse = ""
opt.list = false

vim.diagnostic.config({ virtual_text = false })
