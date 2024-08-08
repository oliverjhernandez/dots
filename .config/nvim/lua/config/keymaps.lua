local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("n", "x", '"_x')

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
-- keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
-- keymap.set("n", "sh", "<C-w>h")
-- keymap.set("n", "sk", "<C-w>k")
-- keymap.set("n", "sj", "<C-w>j")
-- keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Toggle Terminal
keymap.set("n", "<C-\\>", ":ToggleTerm size=40 direction=float<cr>")
-- keymap.set("n", "<leader>tv", ":ToggleTerm size=100 direction=vertical<cr>")
-- keymap.set("n", "<leader>th", ":ToggleTerm size=100 direction=horizontal<cr>")
keymap.set("t", "<C-\\>", "<C-\\><C-n><C-w>l")

-- Diagnostics
keymap.set("n", "<leader>j", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>k", function()
  vim.diagnostic.goto_prev()
end)

-- Neogen
keymap.set("n", "<leader>cc", function()
  require("neogen").generate({})
end)

-- Inc Rename
vim.keymap.set("n", "<leader>rn", ":IncRename ")

-- dial
vim.keymap.set("n", "<C-a>", function()
  require("dial.map").manipulate("increment", "normal")
end)
vim.keymap.set("n", "<C-x>", function()
  require("dial.map").manipulate("decrement", "normal")
end)

-- telescope
local builtin = require("telescope.builtin")
local telescope = require("telescope")

-- General search in the whole repo
vim.keymap.set("n", "ff", function()
  builtin.find_files()
end)

-- "Searches for the string under your cursor or selection in your current working directory"
vim.keymap.set("n", "fS", function()
  builtin.grep_string()
end)

-- "Lists available colorschemes and applies them on <cr>"
vim.keymap.set("n", ";c", function()
  builtin.colorscheme()
end)

-- "Lists normal mode keymappings"
vim.keymap.set("n", ";k", function()
  builtin.keymaps()
end)

-- "Lists open buffers",
vim.keymap.set("n", "\\\\", function()
  builtin.buffers()
end)

-- "Resume the previous telescope picker",
vim.keymap.set("n", ";;", function()
  builtin.resume()
end)

-- "Lists Diagnostics for all open buffers or a specific buffer",
vim.keymap.set("n", "fd", function()
  builtin.diagnostics()
end)

-- "Lists Function names, variables, from Treesitter",
vim.keymap.set("n", "fs", function()
  builtin.treesitter()
end)

-- "Lists all lsp symbols"
vim.keymap.set("n", "ss", function()
  builtin.lsp_document_symbols()
end)

-- "Lists harpoon files"
vim.keymap.set("n", "hl", "<cmd>Telescope harpoon marks<cr>")

-- "JsonFly"
vim.keymap.set("n", "fj", "<cmd>Telescope jsonfly<cr>")

-- "Open File Browser with the path of the current buffer",
vim.keymap.set("n", "-", function()
  local function telescope_buffer_dir()
    return vim.fn.expand("%:p:h")
  end

  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = true,
    initial_mode = "normal",
    layout_config = { height = 40, width = 160 },
  })
end)

-- Harpoon
local mark = require("harpoon.mark")
local term = require("harpoon.term")

-- Mark a file
vim.keymap.set("n", "<leader>ha", function()
  mark.add_file()
end)

-- Mark a terminal
vim.keymap.set("n", "<leader>h1", function()
  term.gotoTerminal(1)
end)

vim.keymap.set("n", "<leader>h2", function()
  term.gotoTerminal(1)
end)
