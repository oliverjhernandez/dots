local v = vim
local vo = v.opt

v.g.mapleader = " "
v.g.lazyvim_picker = "snacks"

v.scriptencoding = "utf-8"
vo.encoding = "utf-8"
vo.fileencoding = "utf-8"

vim.opt.guicursor = {
  "n-v:block-Cursor/lCursor",
  "i-c-ci-ve:block-TermCursor",
}

vo.relativenumber = false
vo.number = true
vo.title = true
vo.textwidth = 240
vo.autoindent = true
vo.smartindent = true
vo.hlsearch = true
vo.backup = false
vo.showcmd = true
vo.cmdheight = 1
vo.laststatus = 2
vo.expandtab = true
vo.scrolloff = 10
vo.shell = "zsh"
vo.backupskip = { "/tmp/*", "/private/tmp/*" }
vo.inccommand = "split"
vo.ignorecase = true
vo.smarttab = true
vo.breakindent = true
vo.shiftwidth = 2
vo.tabstop = 2
vo.wrap = false
vo.backspace = { "start", "eol", "indent" }
vo.path:append({ "**" }) -- Finding files - Search down into subfolders
vo.wildignore:append({ "*/node_modules/*" })
vo.splitbelow = true -- Put new windows below current
vo.splitright = true -- Put new windows right of current
vo.splitkeep = "cursor"
vo.mouse = ""

-- Undercurl
v.cmd([[let &t_Cs = "\e[4:3m"]])
v.cmd([[let &t_Ce = "\e[4:0m"]])

-- Add asterisks in block comments
vo.formatoptions:append({ "r" })

v.cmd([[au BufNewFile,BufRead *.astro setf astro]])
v.cmd([[au BufNewFile,BufRead Podfile setf ruby]])

v.diagnostic.config({ virtual_text = false })
