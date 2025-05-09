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

k.set("n", "<C-h>", "<cmd>NvimTmuxNavigateLeft<CR>")
k.set("n", "<C-j>", "<cmd>NvimTmuxNavigateDown<CR>")
k.set("n", "<C-k>", "<cmd>NvimTmuxNavigateUp<CR>")
k.set("n", "<C-l>", "<cmd>NvimTmuxNavigateRight<CR>")
k.set("n", "<C-\\>", "<cmd>NvimTmuxNavigateLastActive<CR>")
k.set("n", "<C-Space>", "<cmd>NvimTmuxNavigateNext<CR>")

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

-- Kulala
k.set("n", "<leader>tr", function() -- Run test
  require("kulala").run()
end)
k.set("n", "<leader>ta", function() -- Run all tests
  require("kulala").run_all()
end)
k.set("n", "<leader>tt", function() -- Replay last test
  require("kulala").replay()
end)
k.set("n", "<leader>tc", function() -- Copy test as curl command
  require("kulala").run()
end)
k.set("n", "<leader>tj", function() -- Go to next test
  require("kulala").jump_next()
end)
k.set("n", "<leader>tk", function() -- Go to previous test
  require("kulala").jump_prev()
end)

-- dial
k.set("n", "<C-a>", function()
  require("dial.map").manipulate("increment", "normal")
end)
k.set("n", "<C-x>", function()
  require("dial.map").manipulate("decrement", "normal")
end)

-- Mark a file
k.set("n", "<leader>ha", function()
  mark.add_file()
end)

-- Mark a terminal
k.set("n", "<leader>h1", function()
  term.gotoTerminal(1)
end)

k.set("n", "<leader>h2", function()
  term.gotoTerminal(1)
end)
