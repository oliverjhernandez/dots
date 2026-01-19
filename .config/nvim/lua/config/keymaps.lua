local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Delete without yanking
keymap("n", "x", '"_x')

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Tab navigation
keymap("n", "te", ":tabedit<CR>", opts)
keymap("n", "<tab>", ":tabnext<CR>", opts)
keymap("n", "<S-tab>", ":tabprev<CR>", opts)

-- Split windows
keymap("n", "ss", ":split<CR>", opts)
keymap("n", "sv", ":vsplit<CR>", opts)
