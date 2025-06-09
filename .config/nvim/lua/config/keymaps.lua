local k = vim.keymap
local opts = { noremap = true, silent = true }

k.set("n", "x", '"_x')

-- Increment/decrement numbers
k.set("n", "+", "<C-a>")
k.set("n", "-", "<C-x>")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
k.set("n", "<Leader>o", "o<Esc>^Da", opts)
k.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
k.set("n", "<C-m>", "<C-i>", opts)

-- New tab
k.set("n", "te", ":tabedit")
k.set("n", "<tab>", ":tabnext<Return>", opts)
k.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
k.set("n", "ss", ":split<Return>", opts)
k.set("n", "sv", ":vsplit<Return>", opts)

-- Toggle Terminal
k.set("n", "<C-\\>", ":ToggleTerm size=40 direction=float<cr>")
-- keymap.set("n", "<leader>tv", ":ToggleTerm size=100 direction=vertical<cr>")
-- keymap.set("n", "<leader>th", ":ToggleTerm size=100 direction=horizontal<cr>")
k.set("t", "<C-\\>", "<C-\\><C-n><C-w>l")

-- Diagnostics
k.set("n", "<leader>j", function()
  vim.diagnostic.jump({ count = 1, float = true })
end, opts)

k.set("n", "<leader>k", function()
  vim.diagnostic.jump({ count = -1, float = true })
end)

-- Neogen
k.set("n", "<leader>cc", function()
  require("neogen").generate({})
end)

-- Inc Rename
k.set("n", "<leader>rn", ":IncRename ")
